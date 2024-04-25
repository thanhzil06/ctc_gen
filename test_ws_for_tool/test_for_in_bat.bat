@echo off
setlocal enabledelayedexpansion

rem Specify the name of the output text file
set "output_file=hex_file_list.txt"

rem Clear the content of the output file if it exists
::echo. > "%output_file%"

rem Loop through all .hex files in the current directory
for %%i in (*.hex) do (
    rem Append the file name to the output file
    echo %%~i >> "%output_file%"
)

echo "List of .hex files written to %output_file%"
