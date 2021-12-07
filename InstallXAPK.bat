@echo off

echo Windows Subsystem for Android XAPK app installer
echo This script uses adb and simplifies installation for XAPK bundles on WSA.
echo Before you start, please ensure that you toggled "Developer Mode" on in WSA settings.
echo Please note that OBB files are not supported by this script at the moment. After installation, the script will exit by itself.
echo Please wait...

:: Pre-installation - restarting WSA
WsaClient.exe /restart
%cd%\adb connect localhost:58526

:apk_install
set /P apk=Drag and drop your XAPK bundle here / type in the path here then press "Enter":

:: Extract XAPK to temp dir and create batch file
echo Extracting APK file...
%cd%\7z e -aoa "%apk%" -otemp

:: Delete icon and manifest, then create batch
cd temp
del icon.png
del manifest.json
cd temp
dir /b > temp.bat

:: Create batch (2) - Replace stuffs
%cd%\..\fart.exe "temp.bat" "com." "%cd%\..\adb install "com."
%cd%\..\fart.exe "temp.bat" "config" "%cd%\..\adb install config"
%cd%\..\fart.exe -C "temp.bat" temp.bat "  "

:: Run final generated ADB script
echo Installing...
start temp.bat
call PostInstallAPK.bat