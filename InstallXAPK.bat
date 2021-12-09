@echo off
:: Import lang properties
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini Localization Language') do set lang=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallXAPK intro1') do set intro1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallXAPK intro2') do set intro2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallXAPK intro3') do set intro3=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallXAPK intro4') do set intro4=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni waitprompt') do set waitprompt=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallXAPK importxapk') do set importxapk=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallXAPK extractprompt') do set extractprompt=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni install') do set installprompt=%%i >nul

echo %intro1%
echo %intro2%
echo %intro3%
echo %intro4%
echo %waitprompt%

:: Pre-installation - restarting WSA
WsaClient.exe /restart
%cd%\adb connect localhost:58526

:apk_install
set /P apk=%importxapk%

:: Extract XAPK to temp dir and create batch file
echo %extractprompt%
%cd%\7z e -aoa "%apk%" -otemp

:: Delete icon and manifest, then create batch
cd temp
del icon.png
del manifest.json
cd temp
dir /b > temp.bat

:: Create batch (2) - Replace stuffs
%cd%\..\fart.exe "temp.bat" "com." "%cd%\..\adb install-multiple com."
%cd%\..\fart.exe -C "temp.bat" ".apk\r\n" ".apk \x5e\r\n"
%cd%\..\fart.exe -C "temp.bat" temp.bat "  "

:: Run final generated ADB script
echo %installprompt%
start temp.bat
call ..\PostInstallAPK.bat