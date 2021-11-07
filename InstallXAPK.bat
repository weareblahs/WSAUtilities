@echo off

echo Windows Subsystem for Android XAPK app installer
echo This script uses adb and simplifies installation for XAPK bundles on WSA.
echo Before you start, please ensure that you toggled "Developer Mode" on in WSA settings.
echo Please note that OBB files are not supported by this script at the moment. After installation, the script will exit by itself.
echo Done? then press any key to continue the process.

:: Pre-installation - restarting WSA
WsaClient.exe /restart

:: The following line hides "Press any key to continue" and didn't show text for the process.
pause >nul

:: The line below goes to the APK Installation process listed below
GOTO apk_install

:apk_install
set /P apk=Drag and drop your XAPK bundle here / type in the path here then press "Enter":

:: Extract XAPK to temp dir and create batch file
echo Extracting APK file...
7z e "%apk%" -otemp  >nul

:: Delete icon and manifest, then create batch
cd temp
del icon.png
del manifest.json
cd temp
dir /b > temp.bat

:: Create batch (2) - Replace stuffs
fart "temp.bat" "com." "adb install "com." >nul
fart "temp.bat" "config" "adb install config" >nul
fart -C "temp.bat" temp.bat "  " >nul

:: Extract adb from zip archive
echo Extracting ADB to temp directory...
cd ..
7z e adb.zip -otemp >nul

:: Run final generated ADB script
cd temp
adb connect localhost:58526 >nul
echo Installing...
temp.bat

echo Installation complete!
pause
exit

:::: (Reserved for future uses)
:: Complete prompt
:: echo Installation complete!
:: set /p var=Do you want to install other XAPK files? [Yes / (No)]: 
:: if %var%== Yes GOTO apk_install
:: if %var%== yes GOTO apk_install
:: if not %var%== No exit
:::: (Don't know why this part can't run, if you know why then submit a pull request with the modified script)