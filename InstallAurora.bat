@echo off
:: Installs Aurora Store from F-Droid
echo Downloading Aurora Store...
wget -O aurora.apk https://f-droid.org/repo/com.aurora.store_38.apk
adb connect 127.0.0.1:58526
adb install aurora.apk
echo Installation Complete!
echo Press any key to go back to the WSAtools Menu.
pause >nul

:: Post-install stuffs
del aurora.apk

:: Back to WSATools
cls
WSATools
