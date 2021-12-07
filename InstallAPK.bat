@echo off

echo Windows Subsystem for Android app installer
echo This script uses adb and simplifies installation for APK files on WSA.
echo Before you start, please ensure that you toggled "Developer Mode" on in WSA settings.
echo Please wait...

:: Pre-installation - restarting WSA
WsaClient.exe /restart
%cd%\adb connect localhost:58526

:: The line below goes to the APK Installation process listed below
:start
GOTO apk_install

:apk_install
set /P apk=Drag and drop your APK file here / type in the path here then press "Enter":

:: Copy file to main dir
cd main
copy "%apk%" %cd%\base.apk

:: Start Install
%cd%\adb install base.apk

:: Complete prompt
echo Installation complete!
set /p var=Do you want to install other APK files? [Yes / (No)]: 
if %var%== Yes GOTO apk_install
if %var%== yes GOTO apk_install
if not %var%== No exit