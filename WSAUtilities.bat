@echo off
@title WSAUtilities

:: Import properties from INI
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini VersionInfo ProductName') do set productname=%%i >nul
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini VersionInfo Version') do set version=%%i >nul
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini VersionInfo Codename') do set codename=%%i >nul
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini Localization Language') do set lang=%%i >nul

:: Start localization before starting script
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities SelectPrompt') do set selectprompt=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities 0') do set s0=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities 1') do set s1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities 2') do set s2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities 3') do set s3=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities 4') do set s4=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities 5') do set s5=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities 6') do set s6=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities Additional') do set additional=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities A1') do set a1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities A2') do set a2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities A3') do set a3=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities InstallWSATip') do set iwsatip=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities Disclaimer') do set disc=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSAUtilities Selection') do set selvar=%%i >nul
goto start

:start
echo %productname% %version% %codename%
echo.
echo.

:PostInstallWSA Post-install message
echo %selectprompt%
if exist postinstallwsa.bat (
    echo %s0%
    goto continue
) else (
    goto continue
)

:continue
echo %s1%
echo %s2%
echo %s3%
echo %s4%
echo %s5%
echo.
echo %additional%
echo %a1%
echo %a2%
echo %a3%
echo.
echo %iwsatip%
echo.
echo %disc%
echo.
set /p var=%selvar%
if %var%== 0 GOTO postinstallwsa
if %var%== 1 GOTO installwsa
if %var%== 2 GOTO installwsam
if %var%== 3 GOTO installapk
if %var%== 4 GOTO installxapk
if %var%== 5 GOTO prescreenshot
if %var%== A1 GOTO installaurora
if %var%== a1 GOTO installaurora
if %var%== A2 GOTO installlauncher
if %var%== a2 GOTO installlauncher
if %var%== A3 GOTO enablevmp
if %var%== a3 GOTO enablevmp
if not %var%== GOTO exit

:postinstallwsa
postinstallwsa.bat

:installwsa
cls
nircmd elevate InstallWSA

:installwsam
cls
nircmd elevate InstallWSAMirror

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

:installaurora
cls
InstallAurora.bat

:installlauncher
cls
InstallMicrosoftLauncher.bat

:enablevmp
cls
nircmd elevate EnableVMP