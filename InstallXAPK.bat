@echo off

echo Windows Subsystem for Android XAPK app installer
echo This script uses adb and simplifies installation for XAPK bundles on WSA.
echo Before you start, please ensure that a Android app is open in WSA, such as Amazon Appstore, and also go to "Windows Subsystem for Android" on the start menu and then toggle "Developer Mode" on.
echo Please note that OBB files are not supported by this script at the moment. After installation, the script will exit by itself.
echo Done? then press any key to continue the process.

:: The following line hides "Press any key to continue" and didn't show text for the process.
pause >nul

:: The line below goes to the APK Installation process listed below
GOTO apk_install

:apk_install
set /P apk=Drag and drop your XAPK bundle here / type in the path here then press "Enter":

:: Extract XAPK to temp dir and create batch file
7z e "%apk%" -otemp

:: Delete icon and manifest, then create batch
cd temp
del icon.png
del manifest.json
cd temp
dir /b > temp.bat

:: Create batch (2) - Replace stuffs
fart "temp.bat" "com." "adb install "com."
fart "temp.bat" "config" "adb install config"
fart -C "temp.bat" temp.bat "  "

:: Extract adb from zip archive
cd ..
7z e adb.zip -otemp

:: Run final generated ADB script
cd temp
adb connect localhost:58526
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