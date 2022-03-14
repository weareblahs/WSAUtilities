@echo off
:: Create temp folder
md files
:: Import URL from config file
for /f "delims=" %%i in ('LocalVariables InstallWSA.ini WSAMirror URL') do set url=%%i >nul
:: Downloading
echo Downloading Windows Subsystem for Android from mirror...
aria2c -x 16 -s 16 --out="files\wsa_installation.msix" "%url%"

:install1
echo Starting installation...
powershell Add-AppxPackage -Path files\wsa_installation.msixbundle
echo Enabling Virtual Machine Platform...
dism /online /Enable-Feature /FeatureName:VirtualMachinePlatform /All
echo Installation complete!
echo After restarting your PC, find Windows Subsystem for Android on the Start menu
echo to configure the system. Or, you can just open Amazon Appstore to install apps
echo from the Appstore.
echo Do you want to restart now?
echo [Y]: Yes
echo [N]: No
set /p restartprompt=Select [Y/N]: 
if %restartprompt%== 1 shutdown /r /t 0 /d WSAUtilities Restart
if %restartprompt%== 2 goto exit