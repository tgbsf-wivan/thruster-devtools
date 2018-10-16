@echo off

set ROOT=%~dp0.

echo installing gstreamer ...
"%ROOT%\..\bin\unzip.exe" -q %ROOT%\gstreamer-1.14.4.zip -d %1
move "%1\gstreamer-1.14.4\x86_64" "%1\gstreamer"


