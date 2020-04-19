echo off

REM set TOOLCHAIN=VS2010

REM if %TOOLCHAIN%=="VS2010" 
REM (
ECHO "================================BUILD WITH VS2010============================="

set VS2010_PATH="C:\Program Files (x86)\Microsoft Visual Studio 10.0"
if not exist %VS2010_PATH% set VS2010_PATH="C:\Program Files\Microsoft Visual Studio 10.0"

set VS2010_EXE=%VS2010_PATH%\Common7\IDE\devenv.exe
if not exist %VS2010_EXE% set VS2010_EXE=%VS2010_PATH%\Common7\IDE\VCExpress.exe

echo VS2010 build of tcl c extension lib, configuration "Debug|Win32"

call %VS2010_PATH%\VC\bin\VCVARS32.BAT
set TEMP=
set TMP=
%VS2010_EXE% tcl_c_lib.sln /nologo /rebuild "Debug|Win32"  
pause 
REM )

if %TOOLCHAIN%=="VS2017" 
(
ECHO "================================BUILD WITH VS2017============================="
set VS2017_PATH="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community"
if not exist %VS2017_PATH% set VS2017_PATH="C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools"

set MSBUILD=%VS2017_PATH%\MSBuild\15.0\Bin\MSBuild.exe

set CONFIG_DBG_RLS=Debug
if not "%1"=="" set CONFIG_DBG_RLS=%1
set CONFIG_32_64=Win32
if not "%2"=="" set CONFIG_32_64=%2
set PROJECT_CONFIG="%CONFIG_DBG_RLS%|%CONFIG_32_64%"

echo Build Windows Wrapper with sln project, configuration %PROJECT_CONFIG%

rem call %VS2017_PATH%\VC\Auxiliary\Build\VCVARS32.BAT
echo Build Windows Wrapper tcl_c_lib, configuration %PROJECT_CONFIG%
%MSBUILD% tcl_c_lib.sln /t:rebuild /p:UseEnv=true;Configuration=%CONFIG_DBG_RLS%;Platform=%CONFIG_32_64%
pause
)