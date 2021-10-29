@echo off

echo Windows Subsystem for Android Update tool
echo Press any key to start checking for updates.
pause >nul

:: Downloads check_update script from this repo then run it
echo Downloading update script...
curl -o check_update.bat "https://raw.githubusercontent.com/weareblahs/WSAtools/main/update_check"
check_update.bat

:: Final touches
pause >nul
exit
