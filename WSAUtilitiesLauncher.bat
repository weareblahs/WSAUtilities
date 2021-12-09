@echo off
:: Start text
echo WSAUtilities launcher
echo Windows Subsystem for Android requires the latest version of Windows 11. Please wait as we check that if your PC is running the latest version.
del checkver.bat
:: Move ver content to text file
ver >> checkver.bat
:: Replace terms, making the batch file return "echo (version)"
main\fart checkver.bat "Microsoft Windows [Version" " " >nul
main\fart checkver.bat "]" " " >nul
main\fart -C checkver.bat \r\n " " >nul
main\fart -C checkver.bat "   " "@echo off \r\n echo " >nul
main\fart checkver.bat "  " " " >nul
main\fart -C checkver.bat ".348 " ".348\r\n" >nul
main\fart checkver.bat " echo " "echo " >nul
for /f %%N in ('checkver') do set "check=%%N"
for /f %%N in ('echo %check:~5,5%') do set "check2=%%N"
if %check2% == 22000 (
:: Success screen
  cls
  echo Windows version up-to-date, which means it supports Windows Subsystem for Android. 
  echo Launching in 3 seconds...
  timeout 1 > NUL
  cls
  echo Windows version up-to-date, which means it supports Windows Subsystem for Android. 
  echo Launching in 2 seconds...
  timeout 1 > NUL
  cls
  echo Windows version up-to-date, which means it supports Windows Subsystem for Android. 
  echo Launching in 1 seconds...
  timeout 1 > NUL
  del checkver.bat
  cls
  cd main
  WSAUtilities
  pause >nul
) else (
:: Failed screen
  cls
  echo Windows version not supported for Windows Subsystem for Android.
  echo Your current Windows build is %check% meanwhile WSAUtilities needs Windows 11 to run.
  echo Please check for Windows updates, update it and try again. This detection script detects for
  echo the newest build of Windows 11. You can also try to run the script by going to the "main"
  echo folder then find "WSAUtilities.bat".
  echo Press any key to exit.
  del checkver.bat
  pause >nul
  cls
  exit
)
