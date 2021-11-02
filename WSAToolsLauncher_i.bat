@echo off
:: Start text
echo WSATools launcher
echo Windows Subsystem for Android requires the latest version of Windows 11. Please wait as we check that if your PC is running the latest version.
del checkver.bat
:: Move ver content to text file
ver >> checkver.bat
:: Replace terms, making the batch file return "echo (version)"
main\fart checkver.bat "Microsoft Windows [Version" " "
main\fart checkver.bat "]" " "
main\fart -C checkver.bat \r\n " "
main\fart -C checkver.bat "   " "@echo off \r\n echo "
main\fart checkver.bat "  " " "
main\fart -C checkver.bat ".282 " ".282\r\n"
main\fart checkver.bat " echo " "echo "
for /f %%N in ('checkver') do set "check=%%N"
if %check% == 10.0.22000.282 (
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
  echo Your current Windows build is %check% meanwhile WSATools needs build 10.0.22000.282.
  echo Press any key to exit.
  del checkver.bat
  pause >nul
  cls
  exit
)