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
set /P url=Enter the URL here:

echo Starting download...
aria2c -x 16 -s 16 -o wsa_installation.msixbundle "%url%"

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
