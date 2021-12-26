@echo off
echo Checking internet connection...
ping time.akamai.com -n 1 -w 1000 >nul
cls
if errorlevel 1 (
echo No internet connection. Please connect to Wi-Fi or Ethernet with internet connection to continue setup.
) else (
goto startsetup
)

echo %internet%