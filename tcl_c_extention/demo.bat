@echo off

REM need to manually call  .\pkg\lib\build_lib.bat  in folders
@echo set argv {%*};source application.tcl | ..\tools\tclkitsh-8.5.9-win32.upx.exe
..\tools\tclkitsh-8.5.9-win32.upx.exe
IF %ERRORLEVEL% EQU 1 goto Exit
EXIT
:Exit
ECHO "error !"
pause