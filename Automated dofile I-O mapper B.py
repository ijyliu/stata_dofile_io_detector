# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.6.0
#   kernelspec:
#     display_name: Python 3
#     language: python
#     name: python3
# ---

# +
# Alternate version of the I-O detector
# NOTE: DO NOT USE in cases where multiple files have the same name, but different paths.

# +
# USER ADJUSTMENTS

# Set path to the common directory of dofiles
# On windows, correct \ to /
# Path should end with a /
path = ''

# Set write_to_path and name to a place where you want the file listing IO to be saved
# On windows, correct \ to /
# Path should end with a /
write_to_path = ''
# Saved automatically with extension .txt
write_to_name = ''

# +
# Detect the dofiles in the directory
# Note this is not a recursive search
# Source: https://stackoverflow.com/questions/3207219/how-do-i-list-all-files-of-a-directory
from os import listdir
from os.path import isfile, join
onlyfiles = [f for f in listdir(path) if isfile(join(path, f))]

# Filter to only dofiles
dofile_names = [f for f in onlyfiles if f[-3:] == '.do']


# +
# Set up the structure for dofile objects (a collection of lists)
class dofile:
    def __init__(self):
        self.name = ""
        self.lines = []
        self.flags_com = []
        self.inputs = []
        self.outputs = []
        self.intermediates = []
    
# Basic classes syntax: https://www.learnpython.org/en/Classes_and_Objects


# +
# Code structure note: for the purposes of debugging, I am making many small loops.
# I understand that having one big loop probably runs faster.
# -

# Create dofile objects based on names
dofiles = []
for name in dofile_names:
    df = dofile()
    df.name = name
    dofiles.append(df)

# Read in the files, line by line.
# I use splitlines to get rid of newlines and then strip to get rid of tabs.
for dofile in dofiles:
    with open(path + dofile.name, 'r') as f:
        dofile.lines = [line.strip() for line in f.read().splitlines()]

# Clean out blank lines (otherwise we will get index errors later)
for dofile in dofiles:
    dofile.lines = [line for line in dofile.lines if line != '']

# +
# At the moment it appears hard to detect comment blocks w/ /* notation, but here's an attempt.
# https://stackoverflow.com/questions/36860206/delete-lines-between-two-patterns-when-there-are-multiple-matches-in-python

# +
# A key problem appears to be unpredictable comment structure- ie nested comments, a pattern such as:
# /*
# /*
# */
# more text

# The question is whether 'more text' should be commented or not- Stata says that it should be.
# Experimentally, I'm developing flags to represent a 'level' of nested comment. Overall, anything with level 1 or higher
# will be treated as commented out.

# +
# Prep for RegEx detection
# Guide: https://developers.google.com/edu/python/regular-expressions

import re

# +
# Clean out /* to */ commented blocks
# -

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

# +
# Still to tackle: cases where /* is used in the middle of a line but we still want the
# first part before that, for example.
# -

for dofile in dofiles:
    dofile.lines = [l for l, f in zip(dofile.lines, dofile.flags_com) if f == 0]

# Clean out all remaining * commented lines
for dofile in dofiles:
    dofile.lines = [line for line in dofile.lines if line[0] != '*']
# Source: https://stackoverflow.com/questions/1207406/how-to-remove-items-from-a-list-while-iterating

# Clean out // commented lines.
for dofile in dofiles:
    dofile.lines = [line.split("//")[0] for line in dofile.lines]

# +
# Possible code to interpret files with the same filename but different full paths
# as the same file, both for recording i-o and for marking intermediates
# -

# Create a long paths list which will store the longest path name for as many files as possible.
long_paths = []


# Create a function which takes a long path and returns a file name if it can detect it;
# else return the same long_path
def find_file_name(long_path):
    name_match = re.search(r'[^\\\/]+\.[^\"]+', long_path)
    if name_match:
        return name_match.group()
    else:
        no_period_match = re.search(r'[^\\\/]+$', long_path)
        if no_period_match:
            return no_period_match.group()
    return long_path


# +
#for dofile in dofiles:
#    dofile.inputs = [checked_names(input) for input in dofile.inputs]
#    dofile.outputs = [checked_names(output) for output in dofile.outputs]

# +
# Beginning I/O detection:
# Code should be adjusted to allow for spaces within file paths and other weird behavior, as
# long as the file path is in quotes (single or double). I handle this by relaxing the
# 'NOT SPACE' restriction and just having the match run until there is a comma or end of line.

# +
# Using is a complicated case that can be involved in inputs and outputs.
# -

# using
for dofile in dofiles:
    for line in dofile.lines:
        using_match = re.search(r'using ([^\s,]+)', line)
        if using_match:
            use_match = re.search(r'use', line)
            append_match = re.search(r'append', line)
            merge_match = re.search(r'merge', line)
            is_match = re.search(r'insheet', line)
            id_match = re.search(r'import delimited', line)
            os_match = re.search(r'outsheet', line)
            to_add = using_match.group(1)
            if to_add[0] == "\"" or to_add[0] == "\'":
                q_match = re.search(r'using ([^,\n]+)', line)
                to_add = q_match.group(1)
            long_paths.append(to_add)
            to_add = find_file_name(to_add)
            if (use_match or append_match or merge_match or is_match or id_match) and to_add not in dofile.inputs:
                dofile.inputs.append(to_add)
            if (os_match) and to_add not in dofile.outputs:
                dofile.outputs.append(to_add)

# +
# Input detectors
# -

# use
for dofile in dofiles:
    for line in dofile.lines:
        use_match = re.search(r'use ([^\s,]+)', line)
        if use_match:
            to_add = use_match.group(1)
            if to_add[0] == "\"" or to_add[0] == "\'":
                q_match = re.search(r'use ([^,\n]+)', line)
                to_add = q_match.group(1)
            long_paths.append(to_add)
            to_add = find_file_name(to_add)
            if to_add not in dofile.inputs:
                dofile.inputs.append(to_add)

# import delimited
# only match if not already caught by using
for dofile in dofiles:
    for line in dofile.lines:
        id_match = re.search(r'import delimited ([^\s,]+)', line)
        using_match = re.search(r'using', line)
        if id_match and not using_match:
            to_add = id_match.group(1)
            if to_add[0] == "\"" or to_add[0] == "\'":
                q_match = re.search(r'import delimited ([^,\n]+)', line)
                to_add = q_match.group(1)
            long_paths.append(to_add)
            to_add = find_file_name(to_add)
            if to_add not in dofile.inputs:
                dofile.inputs.append(to_add)

# +
# Output detectors
# -

# save
for dofile in dofiles:
    for line in dofile.lines:
        save_match = re.search(r'save ([^\s,]+)', line)
        if save_match:
            to_add = save_match.group(1)
            if to_add[0] == "\"" or to_add[0] == "\'":
                q_match = re.search(r'save ([^,\n]+)', line)
                to_add = q_match.group(1)
            long_paths.append(to_add)
            to_add = find_file_name(to_add)
            if to_add not in dofile.outputs:
                dofile.outputs.append(to_add)

# save_chart
for dofile in dofiles:
    for line in dofile.lines:
        sc_match = re.search(r'save_chart ([^\s,]+)', line)
        if sc_match:
            to_add = sc_match.group(1)
            if to_add[0] == "\"" or to_add[0] == "\'":
                q_match = re.search(r'save_chart ([^,\n]+)', line)
                to_add = q_match.group(1)
            long_paths.append(to_add)
            to_add = find_file_name(to_add)
            if to_add not in dofile.outputs:
                dofile.outputs.append(to_add)


# +
# Now we should have long_path full of paths and inputs and outputs full of file_names.
# We will now replace these items in inputs and outputs with the longest paths

# +
# Create a function which takes a file name and tries to find the fullest path
# Probably not the most efficient way to do this, but function will need file_name objects to keep lists together.
# -

# Set up structure for file_name objects (again, a smaller collection of lists)
class file_name_obj:
    def __init__(self):
        self.name = ""
        self.paths = []
        self.longest_path = ""


# Create a function which takes a file name and tries to find the fullest path
def find_longest_path(file_name):
    paths = []
    longest_path = ""
    for long_path in long_paths:
        long_path_match = re.search(file_name, long_path)
        if long_path_match:
            paths.append(long_path)
    if paths == []:
        return file_name
    longest_path = max(paths, key=len)
    return longest_path


# Use function to expand inputs and outputs file names to longest paths.
for dofile in dofiles:
    dofile.inputs = [find_longest_path(input) for input in dofile.inputs]
    dofile.outputs = [find_longest_path(output) for output in dofile.outputs]


# +
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
# -

# Handle intermediates- file is in the input list and output list
for dofile in dofiles:
    dofile.intermediates = list(set(dofile.inputs) & set(dofile.outputs))
    for intermediate in dofile.intermediates:
        dofile.inputs.remove(intermediate)
        dofile.outputs.remove(intermediate)

# Toss fig1 and `0' from save_chart example code
# This chunk can be removed if /* and */ treatment can be improved.
for dofile in dofiles:
    if "\"`0\'\"" in dofile.outputs:
        dofile.outputs.remove("\"`0\'\"")
    if "\"fig1\"" in dofile.outputs:
        dofile.outputs.remove("\"fig1\"")

# Write the overall list of inputs and outputs to a .txt file
with open(write_to_path + write_to_name + '.txt', 'w') as f:
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
