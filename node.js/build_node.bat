@echo off

set ROOT=%~dp0.

echo preparing python 2.7 ...
if exist %ROOT%\python27 ( rmdir /s /q  %ROOT%\python27 )
"%ROOT%\..\bin\unzip.exe" %ROOT%\python27.zip -d %ROOT%

set OLD_PATH=%PATH%
set PATH=%ROOT%\python27;%PATH%

if exist %ROOT%\nasm-2.13.03 ( rmdir /s /q  %ROOT%\nasm-2.13.03 )
"%ROOT%\..\bin\unzip.exe" %ROOT%\nasm-2.13.03-win64.zip -d %ROOT%
set PATH=%ROOT%\nasm-2.13.03;%PATH%

if exist %ROOT%\node-v10.6.0 ( rmdir /s /q  %ROOT%\node-v10.6.0 )
"%ROOT%\..\bin\unzip.exe" %ROOT%\node-v10.6.0.zip -d %ROOT%
pushd %ROOT%\node-v10.6.0
call vcbuild.bat release x64 vs2017 
popd

mkdir %1\node
mkdir %1\node\node_modules
mkdir %1\node\node_modules\npm
xcopy /e %ROOT%\node-v10.6.0\deps\npm %1\node\node_modules\npm
copy /y %ROOT%\node-v10.6.0\deps\npm\bin\npm.cmd %1\node
copy /y %ROOT%\node-v10.6.0\deps\npm\bin\npx.cmd %1\node
copy /y %ROOT%\node-v10.6.0\Release\node.exe %1\node

mkdir %1\node\lib
copy /y %ROOT%\node-v10.6.0\Release\node.lib %1\node\lib
rem xcopy /e %ROOT%\node-v10.6.0\Release\lib\*.lib %1\node\lib 

mkdir %1\node\include
xcopy /e %ROOT%\node-v10.6.0\src\*.h %1\node\include
xcopy /e %ROOT%\node-v10.6.0\deps\uv\include\*.h %1\node\include
xcopy /e %ROOT%\node-v10.6.0\deps\v8\include\*.h %1\node\include

set PATH=%OLD_PATH%



