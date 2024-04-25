@echo off
rem  CTC++ System
rem  ctc2html batch file for CTC++ to HTML converter invoking
rem
rem  RCSfile     : $RCSfile: ctc2html.bat $
rem  Version     : $Revision: 1.9 $, $Date: 2014/02/25 08:59:22 $
rem  Last Edited : 25.2.2014
rem  Author      : $Author: jorma $
rem
rem  Copyright (C) 1997-2013 Testwell Oy
rem  Copyright (c) 2013-2014 Verifysoft Technology GmbH
rem
rem

rem Some, but not all, sanity checks...
if "%CTCHOME%" == "" goto NoCTCHOME
if not exist %CTCHOME%\perl\perl.exe goto NoPERL

rem prepend PATH (so that exactly "our" PerlGlob.exe comes into use!)
set OLDPATH=%PATH%
set PATH=%CTCHOME%\Perl;%PATH%

rem Do the actual perl run...
"%CTCHOME%\perl\perl" "%CTCHOME%\ctc2html_annot.pl" %*

rem restore PATH 
set PATH=%OLDPATH%
set OLDPATH=
goto END

:NoCTCHOME
echo.
echo The environment variable CTCHOME does not exist. Set CTCHOME
echo to point to the CTC++ installation directory.
echo.
goto END

:NoPERL
echo.
echo CTC++ installation directory %CTCHOME%
echo does not contain perl subdirectory or it does not contain perl.exe.
echo.
goto end

:END
