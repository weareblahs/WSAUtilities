@echo off
:: Start text
echo WSATools launcher
echo Windows Subsystem for Android requires the latest version of Windows 11. Please wait as we check that if your PC is running the latest version.
del checkver.bat
:: Move ver content to text file
ver >> checkver.bat
:: Replace terms, making the batch file return "echo (version)" >nul
main\fart checkver.bat "Microsoft Windows [Version" " " >nul
main\fart checkver.bat "]" " " >nul
main\fart -C checkver.bat \r\n " " >nul
main\fart -C checkver.bat "   " "@echo off \r\n echo " >nul
main\fart checkver.bat "  " " " >nul
main\fart -C checkver.bat ".346 " ".346\r\n" >nul
main\fart checkver.bat " echo " "echo " >nul
for /f %%N in ('checkver') do set "check=%%N"
if %check% == 10.0.22000.346 (
:: Success screen
  cls
  echo Windows version up-to-date, which means it supports Windows Subsystem for Android. 
  cd main
  WSATools
  pause >nul
) else (
:: Failed screen
  cls
  echo Windows version not supported for Windows Subsystem for Android.
  echo Your current Windows build is %check% meanwhile WSATools needs build 10.0.22000.346.
  echo Please check for Windows updates, update it and try again. This detection script detects for
  echo the newest build of Windows 11.
  echo Press any key to exit.
  del checkver.bat
  pause >nul
  cls
  exit
)