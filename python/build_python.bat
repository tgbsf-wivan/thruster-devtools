@echo off

set ROOT=%~dp0.

echo installing python ...
"%ROOT%\..\bin\unzip.exe" -q %ROOT%\python37.zip -d %1
move "%1\python37" "%1\python"
set PATH="%1\python";%PATH%

python -m pip install %ROOT%\PySide2-5.12.1-5.12.1_1-cp35.cp36.cp37-none-win_amd64.whl

