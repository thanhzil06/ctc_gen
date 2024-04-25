@echo off
setlocal enabledelayedexpansion

::--------------------------------------------------------------------------------------::
rem Initialize a variable to store the concatenated names of MON.sym files
set "sym="
rem Initialize a variable to store the concatenated names of MON.dat files
set "dat="



::--------------------------------------------------------------------------------------::
rem Loop through all .sym files in the current directory
for %%i in (*.sym) do (
	rem Append the name of the current .sym file to the variable
	set "sym=!sym! %%i"
)
rem Remove the leading space (optional)
set "sym=!sym:~1!"

::echo !sym! > sym_test.txt
::echo All .sym file names in one line: !sym!



::--------------------------------------------------------------------------------------::
rem Loop through all .dat files in the current directory
for %%i in (*.dat) do (
	rem Append the name of the current .sym file to the variable
	set "dat=!dat! %%i"
)
rem Remove the leading space (optional)
set "dat=!dat:~1!"

::echo !dat! > dat_test.txt
::echo All .dat file names in one line: !dat!


::--------------------------------------------------------------------------------------::
rem Generate combined PROFILE.txt file
call %CTCHOME%\ctcpost.exe -p combined_coverage.txt !sym! !dat!
rem Generate html report
::&& call %CTCHOME%\ctc2html.bat --enable-annotations -i combined_coverage.txt -t 85 –nsb
call %CTCHOME%\ctc2html.bat --enable-annotations -i combined_coverage.txt -t 85 –nsb :: BUG :)