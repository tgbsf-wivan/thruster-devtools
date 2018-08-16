@echo off

set ROOT=%~dp0.
set VERSION=1_65_1

echo installing boost ...
if exist "%ROOT%\boost_%VERSION%" (
	echo removing "%ROOT%\boost_%VERSION%" directory ...
	rmdir /s /q "%ROOT%\boost_%VERSION%"
)

"%ROOT%\..\bin\unzip.exe" -o "%ROOT%\boost_%VERSION%.zip" -d "%ROOT%" 
copy /y "%ROOT%\visualc.hpp" "%ROOT%\boost_%VERSION%\boost\config\compiler\visualc.hpp"
copy /y "%ROOT%\builtin_converters.cpp" "%ROOT%\boost_%VERSION%\libs\python\src\converter\builtin_converters.cpp" 

echo "%ROOT%\boost_%VERSION%"
pushd "%ROOT%\boost_%VERSION%"
call .\bootstrap.bat
.\b2.exe install --prefix="%1/boost" address-model=64 variant=release link=static threading=multi -j 16
popd

echo installing boost.beast ...
"%ROOT%\..\bin\unzip.exe" -o "%ROOT%\beast-124.zip" -d "%ROOT%" 
move /y "%ROOT%\beast-124\include\boost\beast" "%1/boost/include/boost-%VERSION%/boost"
move /y "%ROOT%\beast-124\include\boost\beast.hpp" "%1/boost/include/boost-%VERSION%/boost"

