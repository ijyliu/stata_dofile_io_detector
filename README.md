# d-IO-file, a Stata Dofile I/O Detector

A simple regEx based Python program which detects inputs and outputs to Stata do files and produces a .txt output.

## Usage

On Windows, run the executable `d-IO-file_Installer.exe` by clicking on it or by typing `.\d-IO-file_Installer.exe` on the command line. Then you should be able to run the program from any location by typing `d-IO-file` in the command line.

On any platform/alternatively, if you have python installed, you can run `python d-IO-file.py` from a folder with the python script.

Follow the prompts to input a target directory of dofiles (the search is recursive and this can contain subdirectories), and a file name for the desired location of output (without the extension).

## Notes

Made using Inno Setup 6 and the pyinstaller python package.
