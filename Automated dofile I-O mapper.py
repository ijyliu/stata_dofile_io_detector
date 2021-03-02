# Automated dofile I-O Mapper
# Code by Isaac Liu with help from M Z on Stack Overflow

# Get the command line arguments

import sys

print("\nPath to the dofiles:", sys.argv[1])
print("\nPath to write output to:", sys.argv[2])
print("\nOutput file name:", sys.argv[3])


# Set path to the common directory of dofiles
path = sys.argv[1]

# Set write_to_path and name to a place where you want the file listing IO to be saved
write_to_path = sys.argv[2]
# Saved automatically with extension .txt
write_to_name = sys.argv[3]

def fix_path(path):
    path = path.replace("\\", "/")
    return(path)

# Detect the dofiles in the directory
# Note this is not a recursive search
# Source: https://stackoverflow.com/questions/3207219/how-do-i-list-all-files-of-a-directory
import os
allfiles = [(fix_path(dp), f) for dp, dn, fn in os.walk(os.path.expanduser(path)) for f in fn]

# Filter to only dofiles
dfs = [df for df in allfiles if df[1][-3:] == '.do']

# Set up the structure for dofile objects (a collection of lists)
class dofile:
    def __init__(self):
        self.path = ""
        self.name = ""
        self.lines = []
        self.flags_com = []
        self.flags_program = []
        self.inputs = []
        self.outputs = []
        self.intermediates = []
    
# Basic classes syntax: https://www.learnpython.org/en/Classes_and_Objects

# Code structure note: for the purposes of debugging, I am making many small loops.
# I understand that having one big loop probably runs faster.

# Create dofile objects based on names
dofiles = []
for d in dfs:
    df = dofile()
    df.path = d[0]
    df.name = d[1]
    dofiles.append(df)

# Read in the files, line by line.
# I use splitlines to get rid of newlines and then strip to get rid of tabs.
for dofile in dofiles:
    with open(dofile.path + "/" + dofile.name, 'r') as f:
        dofile.lines = [line.strip() for line in f.read().splitlines()]

# Clean out blank lines (otherwise we will get index errors later)
for dofile in dofiles:
    dofile.lines = [line for line in dofile.lines if line != '']


# At the moment it appears hard to detect comment blocks w/ /* notation, but here's an attempt.
# https://stackoverflow.com/questions/36860206/delete-lines-between-two-patterns-when-there-are-multiple-matches-in-python

# A key problem appears to be unpredictable comment structure- ie nested comments, a pattern such as:
# /*
# /*
# */
# more text

# The question is whether 'more text' should be commented or not- Stata says that it should be.
# Experimentally, I'm developing flags to represent a 'level' of nested comment. Overall, anything with level 1 or higher
# will be treated as commented out.


# Prep for RegEx detection
# Guide: https://developers.google.com/edu/python/regular-expressions

import re


# Clean out /* to */ commented blocks


# Still to tackle: cases where /* is used in the middle of a line but we still want the
# first part before that, for example.


for dofile in dofiles:
    flag = 0
    for line in dofile.lines:
        match = re.search(r'\/\*', line)
        if match:
            flag += 1
        dofile.flags_com.append(flag)
        match2 = re.search(r'\*\/', line)
        if match2:
            flag -= 1       

for dofile in dofiles:
    dofile.lines = [l for l, f in zip(dofile.lines, dofile.flags_com) if f == 0]

# Clean out all remaining * commented lines
for dofile in dofiles:
    dofile.lines = [line for line in dofile.lines if line[0] != '*']
# Source: https://stackoverflow.com/questions/1207406/how-to-remove-items-from-a-list-while-iterating

# Clean out // commented lines.
for dofile in dofiles:
    dofile.lines = [line.split("//")[0] for line in dofile.lines]


# Clean out program blocks
for dofile in dofiles:
    flag = 0
    for line in dofile.lines:
        match = re.search('^program', line)
        if match:
            flag += 1
        dofile.flags_program.append(flag)
        match2 = re.search('^end', line)
        if match2:
            flag -= 1    

for dofile in dofiles:
    dofile.lines = [l for l, f in zip(dofile.lines, dofile.flags_program) if f == 0]


# I structure the detected i/o as tuples, in case later we want to go back and retrieve the kind of input... 
# ie using, versus use etc.


# Code should be adjusted to allow for spaces within file paths and other weird behavior, as
# long as the file path is in quotes (single or double). I handle this by relaxing the
# 'NOT SPACE' restriction and just having the match run until there is a comma or end of line.


# Using is a complicated case that can be involved in inputs and outputs.


# using
for dofile in dofiles:
    for line in dofile.lines:
        using_match = re.search(r' using +([^\s,]+)', line)
        if using_match:
            use_match = re.search(r'\buse', line)
            append_match = re.search(r'append', line)
            merge_match = re.search(r'merge', line)
            is_match = re.search(r'insheet', line)
            id_match = re.search(r'import delimited', line)
            os_match = re.search(r'outsheet', line)
            et_match = re.search(r'esttab', line)
            jb_match = re.search(r'joinby', line)
            to_add = using_match.group(1)
            if to_add[0] == "\"" or to_add[0] == "\'":
                q_match = re.search(r'using +([^,\n]+)', line)
                to_add = q_match.group(1)
            if (use_match or append_match or merge_match or is_match or id_match or jb_match) and to_add not in dofile.inputs:
                dofile.inputs.append(to_add)
            if (os_match or et_match) and to_add not in dofile.outputs:
                dofile.outputs.append(to_add)

# parmest/parmby saving
for dofile in dofiles:
    for line in dofile.lines:
        saving_match = re.search(r'saving\(([^\s,)]+)', line)
        if saving_match:
            parmest_match = re.search(r'parmest', line)
            parmby_match = re.search(r'parmby', line)
            to_add = saving_match.group(1)
            if to_add[0] == "\"" or to_add[0] == "\'":
                q_match = re.search(r'using +([^,\n]+)', line)
                to_add = q_match.group(1)
            if (parmest_match or parmby_match) and to_add not in dofile.outputs:
                dofile.outputs.append(to_add)


# Input detectors


# use
for dofile in dofiles:
    for line in dofile.lines:
        use_match = re.search(r'\buse +([^\s,]+)', line)
        # DON'T detect lines with using in them, as these have already been caught, and
        # the detector will toss in variable names!
        using_match = re.search(r' using', line)
        if use_match and not using_match:
            to_add = use_match.group(1)
            if to_add[0] == "\"" or to_add[0] == "\'":
                q_match = re.search(r'\buse +([^,\n]+)', line)
                to_add = q_match.group(1)
            if to_add not in dofile.inputs:
                dofile.inputs.append(to_add)

# import delimited
# only match if not already caught by using
for dofile in dofiles:
    for line in dofile.lines:
        id_match = re.search(r'import +delimited +([^\s,]+)', line)
        using_match = re.search(r' using', line)
        if id_match and not using_match:
            to_add = id_match.group(1)
            if to_add[0] == "\"" or to_add[0] == "\'":
                q_match = re.search(r'import +delimited +([^,\n]+)', line)
                to_add = q_match.group(1)
            if to_add not in dofile.inputs:
                dofile.inputs.append(to_add)


# Output detectors


# graph export
for dofile in dofiles:
    for line in dofile.lines:
        ge_match = re.search(r'graph +export +([^\s,]+)', line)
        if ge_match:
            to_add = ge_match.group(1)
            if to_add[0] == "\"" or to_add[0] == "\'":
                q_match = re.search(r'graph +export +([^,\n]+)', line)
                to_add = q_match.group(1)
            if to_add not in dofile.outputs:
                dofile.outputs.append(to_add)

# save
for dofile in dofiles:
    for line in dofile.lines:
        save_match = re.search(r'save +([^\s,]+)', line)
        if save_match:
            to_add = save_match.group(1)
            if to_add[0] == "\"" or to_add[0] == "\'":
                q_match = re.search(r'save +([^,\n]+)', line)
                to_add = q_match.group(1)
            if to_add not in dofile.outputs:
                dofile.outputs.append(to_add)

# save_chart
for dofile in dofiles:
    for line in dofile.lines:
        sc_match = re.search(r'save_chart +([^\s,]+)', line)
        if sc_match:
            to_add = sc_match.group(1)
            if to_add[0] == "\"" or to_add[0] == "\'":
                q_match = re.search(r'save_chart +([^,\n]+)', line)
                to_add = q_match.group(1)
            if to_add not in dofile.outputs:
                dofile.outputs.append(to_add)



# Add quotes to inputs and outputs if they don't already have them.

# Define a simple function for this to be easier with list comprehension
# Function pads a string with quotes if it doesn't start and end with them already.
def cond_q_pad(string):
    if string[0] != "\"" and string[-1] != "\"":
        return '"{}"'.format(string)
    else:
        return string

for dofile in dofiles:
    dofile.inputs = [cond_q_pad(input) for input in dofile.inputs]
    dofile.outputs = [cond_q_pad(output) for output in dofile.outputs]


# Handle intermediates- file is in the input list and output list
for dofile in dofiles:
    dofile.intermediates = list(set(dofile.inputs) & set(dofile.outputs))
    for intermediate in dofile.intermediates:
        dofile.inputs.remove(intermediate)
        dofile.outputs.remove(intermediate)

# Toss fig1 and `0' from save_chart example code
# This chunk can be removed if /* and */ treatment can be improved, 
# and if macro treatment and program treatment can be improved
for dofile in dofiles:
    if "\"`0\'\"" in dofile.outputs:
        dofile.outputs.remove("\"`0\'\"")
    if "\"`0\'\.eps\"" in dofile.outputs:
        dofile.outputs.remove("\"`0\'\.eps\"")
    if "\"`0\'\.pdf\"" in dofile.outputs:
        dofile.outputs.remove("\"`0\'\.pdf\"")
    if "\"fig1\"" in dofile.outputs:
        dofile.outputs.remove("\"fig1\"")

# Perform some global inputs/outputs analysis
all_inputs = []
all_outputs = []
starting_inputs = []
final_outputs = []
project_intermediates = []
for dofile in dofiles:
    for input in dofile.inputs:
        all_inputs.append(input)
    for output in dofile.outputs:
        all_outputs.append(output)
    for input in all_inputs:
        if input not in all_outputs:
            starting_inputs.append(input)
    for output in all_outputs:
        if output not in all_inputs:
            final_outputs.append(output)
        # capture intermediates also (all intermediates are both outputs and inputs)
        elif output not in project_intermediates:
            project_intermediates.append(output)

# Write the overall list of inputs and outputs to a .txt file
with open(write_to_path + "/" + write_to_name + '.txt', 'w') as f:
    f.write("* Automatically generated I-O mappings\n")
    f.write("* code by Isaac Liu with help from M Z on Stack Overflow\n")
    f.write("\n")
    for dofile in dofiles:
        f.write("* " + dofile.name + "\n")
        f.write("* " + "Inputs:\n")
        for input in dofile.inputs:
            f.write("* " + input + "\n")
        f.write("* " + "Outputs:\n")
        for output in dofile.outputs:
            f.write("* " + output + "\n")
        f.write("* " + "Intermediates:\n")
        for intermediate in dofile.intermediates:
            f.write("* " + intermediate + "\n")
        f.write("\n")
    # Also write the global inputs/outputs and intermediates
    f.write("Project starting inputs:" + "\n")
    for input in starting_inputs:
        f.write("* " + input + "\n")
    f.write("Project intermediates:" + "\n")
    for intermediate in project_intermediates:
        f.write("* " + intermediate + "\n")
    f.write("Project final outputs:" + "\n")
    for output in final_outputs:
        f.write("* " + output + "\n")
    f.write("\n")

print("\nA list of inputs and outputs has been written to", write_to_path + "/" + write_to_name + '.txt.' + '\n')
