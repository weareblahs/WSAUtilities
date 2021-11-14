@echo off

echo WSATools v0.0.8 "Gotta Make You Understand"
echo.
echo.
echo Select what you want to do:
echo [1]: Install Windows Subsystem for Android (You might need to run this again as administrator) [InstallWSA]
echo [2]: Install Windows Subsystem for Android (Mirror, You might need to run this again as administrator) [InstallWSAMirror]
echo [3]: Install APK on Windows Subsystem for Android [InstallAPK]
echo [4]: Install XAPK files downloaded from APKPure [InstallXAPK]
echo [5]: [CURRENTLY NOT WORKING] Take screenshot from WSA Window [Screenshot / ScreenshotDT]
echo [6]: Check for WSA updates [UpdateWSA]
echo.
echo Additional Stuffs:
echo [A1]: Install Aurora Store
echo [A2]: Install Microsoft Launcher
echo.
echo For those who didn't know how to get the links for the installation files, select 2.
echo.
echo Disclaimer: This tool isn't affliated with Microsoft Corporation in any kind.
echo.
set /p var=Please select what you want to do: 
if %var%== 1 GOTO installwsa
if %var%== 2 GOTO installwsam
if %var%== 3 GOTO installapk
if %var%== 4 GOTO installxapk
if %var%== 5 GOTO prescreenshot
if %var%== 6 GOTO checkupdate
if %var%== A1 GOTO installaurora
if %var%== a1 GOTO installaurora
if %var%== A2 GOTO installlauncher
if %var%== a2 GOTO installlauncher
if not %var%== GOTO exit
:installwsa
cls
InstallWSA

:installwsa
cls
InstallWSAMirror

:installapk
cls
InstallAPK

:exit
exit

:installxapk
cls
installXAPK

:prescreenshot
cls
echo [1]: PNG, Custom filename
echo [2]: PNG, Date and Time
set /p var2=Select output type:
if %var2%== 1 cls && Screenshot
if %var2%== 2 cls && ScreenshotDT

:checkupdate
cls
UpdateWSA.bat

:installaurora
cls
InstallAurora.bat

:installlauncher
cls
InstallMicrosoftLauncher.bat