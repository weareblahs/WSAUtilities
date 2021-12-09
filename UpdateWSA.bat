@echo off

:: Language setup
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini Localization Language') do set lang=%%i >nul
if %lang% == en (
for /f "delims=" %%i in ('LocalVariables lang\en.ini UpdateWSA checkupdate1') do set checkupdate1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini UpdateWSA checkupdate2') do set checkupdate2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini UpdateWSA downloadupdate') do set downloadupdate=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini UpdateWSA downloadfinish') do set downloadfinish=%%i >nul
goto start
)
echo %checkupdate1%
echo %checkupdate2%
pause >nul

:: Downloads check_update script from this repo then run it
echo %downloadupdate%
wget -q -O check_update.bat "https://raw.githubusercontent.com/weareblahs/WSAUtilities/main/update_check"
echo %downloadfinish%
cls
check_update.bat