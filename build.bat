@echo off

set PWD=%~dp0.
set DEVTOOLS_DIR=%~dp0devtools\2018.6.24.001


rem Make sure there is an empty devtools directory
if exist %DEVTOOLS_DIR% (
	echo removing old devtools directory ...
	rmdir /s /q %DEVTOOLS_DIR%
)
mkdir %DEVTOOLS_DIR%

rem Find Visual Studio installation directory 
set VS_INSTALL_DIR=""
for /f "usebackq tokens=*" %%i in (`"%PWD%\bin\vswhere.exe" -nologo -property installationPath -version 15.0`) do (
	set VS_INSTALL_DIR=%%i
)
if "%VS_INSTALL_DIR%" == "" (
	echo could not find a valid visual studio installation.
	pause
	exit 1
)
call "%VS_INSTALL_DIR%\VC\Auxiliary\Build\vcvars64.bat"

REM building python
call "%PWD%\python\build_python.bat" "%DEVTOOLS_DIR%"

REM building boost
call "%PWD%\boost\build_boost.bat" "%DEVTOOLS_DIR%"

REM building node.js
call "%PWD%\node.js\build_node.bat" "%DEVTOOLS_DIR%"

REM building libusb
call "%PWD%\libusb\build_libusb.bat" "%DEVTOOLS_DIR%"

pause
exit 0



echo update pip ...
python -m pip install -U pip

echo installing pyside ...
python -m pip install PySide

echo install microsoft build tools ...
%ROOT%\bin\unzip.exe -q %ROOT%\msbuildtools\msbuildtools-2017.zip -d %DEVTOOLS_DIR%\
move %DEVTOOLS_DIR%\msbuildtools-2017 %DEVTOOLS_DIR%\msbuildtools
call %DEVTOOLS_DIR%\msbuildtools\VC\Auxiliary\Build\vcvars64.bat x86_x64 10.0.16299.0

echo install git ...
%ROOT%\bin\unzip.exe -q %ROOT%\git\git-2.16.2.zip -d %DEVTOOLS_DIR%\
move %DEVTOOLS_DIR%\git-2.16.2 %DEVTOOLS_DIR%\git
set PATH=%DEVTOOLS_DIR%\git\bin;%PATH%








echo installing unxutils ...
mkdir %DEVTOOLS_DIR%\unxutils
%ROOT%\bin\unzip.exe -q %ROOT%\unxutils\unxutils.zip -d %DEVTOOLS_DIR%\unxutils
set PATH=%DEVTOOLS_DIR%\unxutils\usr\local\wbin;%PATH%

cd /d %ROOT% 
if exist devtools.zip ( del devtools.zip )
zip.exe -r devtools.zip devtools
rmdir /s /q devtools

pause
