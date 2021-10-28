@echo off

echo Windows Subsystem for Android app installer
echo This script uses adb and simplifies installation for APK files on WSA.
echo Before you start, please ensure that a Android app is open in WSA, such as Amazon Appstore, and also go to "Windows Subsystem for Android" on the start menu and then toggle "Developer Mode" on.
echo Done? then press any key to continue the process.

:: The following line hides "Press any key to continue" and didn't show text for the process.
pause >nul

:: The line below goes to the APK Installation process listed below
GOTO apk_install

:apk_install
set /P apk=Drag and drop your APK file here / type in the path here then press "Enter":

:: Connect to ADB. If you want to change it to your ADB address, then change it here.
adb connect localhost:58526

:: Start Install
adb install "%apk"

:: Complete prompt
echo Installation complete!
set /p var=Do you want to install other APK files? [Yes / (No)]: 
if %var%== Yes GOTO apk_install
if %var%== yes GOTO apk_install
if not %var%== No exit