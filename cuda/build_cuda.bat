@echo off

set ROOT=%~dp0.

echo installing cuda ...
"%ROOT%\..\bin\unzip.exe" -q %ROOT%\cuda.zip -d %ROOT%
"%ROOT%\..\bin\unzip.exe" -q %ROOT%\Video_Codec_SDK_8.2.16.zip -d %ROOT%
move "%ROOT%\cuda" "%1"
move "%ROOT%\Video_Codec_SDK_8.2.16" "%1\cuda"



