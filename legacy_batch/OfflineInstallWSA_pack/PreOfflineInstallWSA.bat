@echo off
echo Downloading configuration...
curl -L -o WSAUtilities.ini https://github.com/weareblahs/WSAUtilities/raw/main/WSAUtilities.ini
echo Config downloading complete
cls
echo [1]: Download from mirror
echo [2]: Download manually
set /P var=Select download type:

if %var% == 1 (
    goto dlmirror
)

if %var% == 2 (
    goto dlmanual
)

:dlmirror
:: Get URL variable from INI
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini WSAMirror URL') do set url=%%i >nul
echo Starting download...
aria2c -x 16 -s 16 --file-allocation=trunc --out="files\wsa_installation.msix" "%url%"
echo Download complete!
echo Press any key to exit.
echo You can safely delete PreOfflineInstallWSA and WSAUtilities.ini under this folder.
pause >nul
exit

:dlmanual
set /P url=Enter WSA Address here:
echo Starting download...
aria2c -x 16 -s 16 --file-allocation=trunc --out="files\wsa_installation.msix" "%url%"
echo Download complete!
echo Press any key to exit.
echo You can safely delete PreOfflineInstallWSA and WSAUtilities.ini under this folder.
pause >nul
exit