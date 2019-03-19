@echo off

set ROOT=%~dp0.

echo installing libusb ...
"%ROOT%\..\bin\unzip.exe" -q %ROOT%\libusb-1.0.22.zip -d %1
move "%1\libusb-1.0.22" "%1\libusb"

