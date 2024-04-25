@echo off
setlocal enabledelayedexpansion

rem ====================== STAGE 1: Create data files from the hex ones ====================== 
rem Loop through all .hex files with names like "MONdmp_v.hex"
for %%i in (*.hex) do (
    rem Extract the part of the filename after the "_"
    for /f "tokens=2 delims=_" %%A in ("%%~ni") do (
        rem Set the new names for text and data files         
		set "text_file=MON_%%A.txt"
		set "dat_file=MON_%%A.dat"
    )

    rem Generate the contents of the new text file from the .hex file
	call %CTCHOME%\dmp2txt.bat "%%i" MON.aux > "!text_file!"
    echo Created contents of "!text_file!" from "%%i"
	
	%CTCHOME%\ctc2dat.exe -i "!text_file!" -o "!dat_file!"
	echo Created contents of "!dat_file!" from "!text_file!"
	     
)
echo All .dat files are processed.
rem ====================== STAGE 1 END  ======================



rem ============================================ STAGE 2: CREATE CTC FROM DATA FILES ============================================ 
rem Initialize variables to store the concatenated names of MON.sym and MON.dat files
set "sym="
set "dat="

::--------------------------------------------------------------------------------------::
rem Loop through all .sym files in the current directory
for %%i in (*.sym) do (
	rem Append the name of the current .sym file to the variable
	set "sym=!sym! %%i"
)
rem Remove the leading space (optional)
set "sym=!sym:~1!"
::echo All .sym file names in one line: !sym!



::--------------------------------------------------------------------------------------::
rem Loop through all .dat files in the current directory
for %%i in (*.dat) do (
	rem Append the name of the current .sym file to the variable
	set "dat=!dat! %%i"
)
rem Remove the leading space (optional)
set "dat=!dat:~1!"
::echo All .dat file names in one line: !dat!


::--------------------------------------------------------------------------------------::
rem Generate combined PROFILE.txt file
call %CTCHOME%\ctcpost.exe -p combined_coverage.txt !sym! !dat! 
echo coverage txt generated successfully


::--------------------------------------------------------------------------------------::
rem Set the path to the ctc2html.bat script
set "ctc2html_script=%CTCHOME%\ctc2html.bat"

rem Call ctc2html.bat with the desired arguments
call "%ctc2html_script%" --enable-annotations -i combined_coverage.txt -t 85
echo Finished generating ctc html report
echo ===================================================================================
rem ============================================ STAGE 2 END  ============================================