@echo off
@title InstallMicrosoftLauncher
:: Lang config
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini Localization Language') do set lang=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallMicrosoftLauncher downloading') do set downloading=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni complete1') do set complete1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni complete2') do set complete2=%%i >nul

:: Installs Microsoft Launcher from my own OneDrive storage as most APK sites have an expiry date on their links.
:: Downloaded from APKPure.
echo %downloading%
wget -O mslauncher.apk https://api.onedrive.com/v1.0/shares/u!aHR0cHM6Ly8xZHJ2Lm1zL3UvcyFBbFUxUzJPMlNvMmtxVGVKLWNKT1J2Mi00OHplP2U9MWFqWHpt/root/content
adb connect 127.0.0.1:58526
adb install mslauncher.apk
echo %complete1%
echo %complete2%
pause >nul

:: Post-install stuffs
del mslauncher.apk

:: Back to WSATools
cls
WSAUtilities
