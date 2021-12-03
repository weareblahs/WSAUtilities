@echo off

echo Windows Subsystem for Android app installer
echo This script uses adb and simplifies installation for APK files on WSA.
echo Before you start, please ensure that you toggled "Developer Mode" on in WSA settings.
echo Done? then press any key to continue the process.

:: Pre-installation - restarting WSA
WsaClient.exe /restart

:: The following line hides "Press any key to continue" and didn't show text for the process.
pause >nul

:: The line below goes to the APK Installation process listed below
GOTO apk_install

:apk_install
set /P apk=Drag and drop your APK file here / type in the path here then press "Enter":

:: Connect to ADB. If you want to change it to your ADB address, then change it here.
adb connect localhost:58526

:: Copy file to main dir
cd main
copy "%apk%" base.apk

:: Start Install
adb install base.apk

:: Complete prompt
echo Installation complete!
set /p var=Do you want to install other APK files? [Yes / (No)]: 
if %var%== Yes GOTO apk_install
if %var%== yes GOTO apk_install
if not %var%== No exit