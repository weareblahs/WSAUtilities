@echo off
@title InstallAurora
:: Lang properties
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini Localization Language') do set lang=%%i >nul
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini Localization Language') do set lang=%%i >nul
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini Localization Language') do set lang=%%i >nul
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini Localization Language') do set lang=%%i >nul


:: Installs Aurora Store from F-Droid
echo %downloading%
wget -O aurora.apk https://f-droid.org/repo/com.aurora.store_38.apk
WsaClient.exe 
adb connect 127.0.0.1:58526
adb install aurora.apk
echo %complete1%
echo %complete2%
pause >nul

:: Post-install stuffs
del aurora.apk

:: Back to WSATools
cls
WSAUtilities