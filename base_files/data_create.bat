@echo off
setlocal enabledelayedexpansion

rem Loop through all .hex files with names like "MONdmp_v.hex"
::  for %%i in (MONdmp_*.hex) do (
for %%i in (*.hex) do (
    rem Extract the part of the filename after the "_"
    for /f "tokens=2 delims=_" %%A in ("%%~ni") do (
        rem Set the new text file name
        ::set "new_name=MON_%%A.txt"
		set "text_file=MON_%%A.txt"
		set "dat_file=MON_%%A.dat"
    )

    rem Copy the contents of the .hex file to the new text file
	::copy "%%i" "!new_name!"
	call %CTCHOME%\dmp2txt.bat "%%i" MON.aux > "!text_file!"
    echo Created contents of "!text_file!" from "%%i"
	
	%CTCHOME%\ctc2dat.exe -i "!text_file!" -o "!dat_file!"
	echo Created contents of "!dat_file!" from "!text_file!"
	     
)

::echo Start to generate ctc
::call ctc_gen.bat

echo All files processed.
