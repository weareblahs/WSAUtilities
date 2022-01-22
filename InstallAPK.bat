@echo off
@title InstallAPK
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini Localization Language') do set lang=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallAPK intro1') do set intro1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallAPK intro2') do set intro2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallAPK complete1') do set complete1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallAPK complete2') do set complete2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni yes') do set yes=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni no') do set no=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni waitprompt') do set waitprompt=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallAPK importapk') do set importxapk=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallXAPK extractprompt') do set extractprompt=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni install') do set installprompt=%%i >nul

echo %intro1%
echo %intro2%
echo %intro3%
echo %waitprompt%

:: Pre-installation - restarting WSA
WsaClient.exe /restart
%cd%\adb connect localhost:58526

:: The line below goes to the APK Installation process listed below
:start
GOTO apk_install

:apk_install
set /P apk=%importapk%

:: Copy file to main dir
cd main
copy "%apk%" %cd%\base.apk

:: Start Install
%cd%\adb install base.apk

:: Complete prompt
echo %complete1%
set /p var=%complete2%=[%yes% / (%no%)]: 
if %var%== Yes GOTO apk_install
if %var%== yes GOTO apk_install
if not %var%== No exit