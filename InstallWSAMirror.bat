@echo off

:: The following lines are used to check admin access.
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    GOTO start
) ELSE (
    ECHO Please run this script as administrator. If you didn't know how to run it, then right click then Run as Administrator.
    pause
    exit
)

:start
echo Windows Subsystem for Android installation script
echo This script simplifies the installation of Windows Subsystem for Android and requires compatible Windows 11 computers to install it, no matter you're a Windows Insider or a normal Windows user.
echo This might take 1.2GB of your storage space. Data charges apply.
echo pause
echo Starting download...
:: Change the line below to use a different installer. See https://github.com/weareblahs/wsa-auto-install[hash]how-this-works---a-teardown.
aria2c -x 16 -s 16 -o wsa_installation.msixbundle "https://api.onedrive.com/v1.0/shares/u!aHR0cHM6Ly8xZHJ2Lm1zL3UvcyFBbFUxUzJPMlNvMmtxVFMzRWxlenljN3hhbXBUP2U9Mkx0SHh4/root/content" 

echo Starting installation...
powershell Add-AppxPackage -Path wsa_installation.msixbundle

echo Enabling Virtual Machine Platform through device settings...
dism /online /Enable-Feature /FeatureName:VirtualMachinePlatform /All

echo Installation complete!
echo After enabling Virtual Machine Platform, you might want to restart your computer.
echo Do you want to restart now?
echo After restart, access the WSA control panel through the Start Menu.
echo Amazon Appstore will be pre-installed by default.
echo [Y]: Yes
echo [N]: No
set /p restartprompt=Please select: 
if %restartprompt%== 1 shutdown /r /t 0 /d WSATools Restart
if %restartprompt%== 2 exit
pause
exit
