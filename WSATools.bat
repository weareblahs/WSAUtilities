@echo off
:: Import properties from INI
for /f "delims=" %%i in ('LocalVariables WSATools.ini VersionInfo Version') do set version=%%i >nul
for /f "delims=" %%i in ('LocalVariables WSATools.ini VersionInfo Codename') do set codename=%%i >nul
for /f "delims=" %%i in ('LocalVariables WSATools.ini Localization Language') do set lang=%%i >nul

:: Start localization before starting script
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools SelectPrompt') do set selectprompt=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools 1') do set s1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools 2') do set s2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools 3') do set s3=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools 4') do set s4=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools 5') do set s5=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools 6') do set s6=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools Additional') do set additional=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools A1') do set a1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools A2') do set a2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools InstallWSATip') do set iwsatip=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools Disclaimer') do set disc=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini WSATools Selection') do set selvar=%%i >nul
goto start

:start
echo WSATools %version% %codename%
echo.
echo.
echo %selectprompt%
echo %s1%
echo %s2%
echo %s3%
echo %s4%
echo %s5%
echo %s6%
echo.
echo %additional%
echo %a1%
echo %a2%
echo.
echo %iwsatip%
echo.
echo %disc%
echo.
set /p var=%selvar%
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
nircmd elevate InstallWSA

:installwsa
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

:checkupdate
cls
UpdateWSA.bat

:installaurora
cls
InstallAurora.bat

:installlauncher
cls
InstallMicrosoftLauncher.bat