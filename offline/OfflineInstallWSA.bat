@echo off
echo Checking internet connection...
ping time.akamai.com -n 1 -w 1000 >nul
cls
if errorlevel 1 (
set ofl=1
echo It is recommended that you have a internet connection to start setup. Press any key to start the offline installer.
pause >nul
goto startsetup
) else (
goto startsetup
)

:startsetup
echo *********************************************************************************
echo *                Welcome to InstallWSA Offline Installer!                       *
echo *********************************************************************************
echo.
echo This installer can help you to install Windows Subsystem for Android on a PC without any
echo internet connection.
echo.
echo.
echo.
echo.
echo.
echo Press any key to start setup.
pause >nul
goto check

:check
:: Checks if wsa msixbundle is in the "files" folder
if exist files\wsa_installation.msixbundle (
echo file exists
pause
) else (
echo file doesn't exist
pause
)