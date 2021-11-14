@echo off
:: Installs Microsoft Launcher from my own OneDrive storage as most APK sites have an expiry date on their links.
:: Downloaded from APKPure.
echo Downloading Microsoft Launcher...
wget -O mslauncher.apk https://api.onedrive.com/v1.0/shares/u!aHR0cHM6Ly8xZHJ2Lm1zL3UvcyFBbFUxUzJPMlNvMmtxVGVKLWNKT1J2Mi00OHplP2U9MWFqWHpt/root/content
adb connect 127.0.0.1:58526
adb install mslauncher.apk
echo Installation Complete!
echo Press any key to go back to the WSAtools Menu.
pause >nul

:: Post-install stuffs
del mslauncher.apk

:: Back to WSATools
cls
WSATools
