@echo off
@cmd /c "echo set prefix application;set argv {%*};source main.tcl | tclkitsh-8.5.9-win32.upx.exe"
pause 