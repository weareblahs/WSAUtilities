@echo off

:: The following lines are used to check admin access.
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    GOTO start
) ELSE (
    ECHO Please run this script as administrator. If you didn't know how to run it, then right click > Run as Administrator.
    pause
)

:start
echo Windows Subsystem for Android installation script
echo This script simplifies the installation of Windows Subsystem for Android and requires compatible Windows 11 computers to install it, no matter you're a Windows Insider or a normal Windows user.
echo Can't find the URL? See https://github.com/weareblahs/wsa-auto-install#how-to-use.
set /P url=Enter the URL here:

echo Starting download...
:: Change the line below to use a different installer. See https://github.com/weareblahs/wsa-auto-install[hash]how-this-works---a-teardown.
aria2c -x 16 -s 16 -o wsa_installation.msix "%url%" 

echo Starting installation...
powershell Add-AppxPackage -Path wsa_installation.msix

echo Installation complete!
echo Find Windows Subsystem for Android on the Start menu.
echo pause
