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
    set ofl=0
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
echo WSA package detected.
set /P installconf=Install? [Y/N]
goto install
) else (goto prestartdownload)

:install
if %installconf%==y goto install1
if %installconf%==Y goto install1
if %installconf%==n goto exit
if %installconf%==N goto exit

:install1
echo Starting installation...
powershell Add-AppxPackage -Path files\wsa_installation.msixbundle
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


:prestartdownload
    if %ofl% == 1 (
        echo WSA package not detected.
        echo It is required that you should run PreOfflineInstallWSA.bat on a computer connected to the Internet.
        echo Or, you can move your existing WSA MSIX package to the "files" folder and rename it to wsa_installation.msixbundle
        echo to continue installation.
        echo.
        echo Press any key to exit this tool.
        pause >nul
        exit
    ) 
    if %ofl% == 0 (
        goto startdownload
    )

:startdownload
echo It seems that you have an Internet connection. Do you want this tool to open PreOfflineInstallWSA for you to download the necessary files?
set /p startdownload_com=[Y/N]
if %startdownload_com% == Y (
    PreOfflineInstallWSA.bat
) if %startdownload_com% == y (
    PreOfflineInstallWSA.bat
) else (
    exit
)

:exit
exit