@echo off
echo WSATools launcher
echo Windows Subsystem for Android requires the latest version of Windows 11. Please wait as we check that if your PC is running the latest version.
del checkver.bat
ver >> checkver.bat
fart checkver.bat "Microsoft Windows [Version" " "
fart checkver.bat "]" " "
fart -C checkver.bat \r\n " "
fart -C checkver.bat "   " "@echo off \r\n echo "
fart checkver.bat "  " " "
fart -C checkver.bat ".282 " ".282\r\n"
fart checkver.bat " echo " "echo "
for /f %%N in ('checkver') do set "check=%%N"
if %check% == 10.0.22000.282 (
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
  WSATools
  pause >nul
) else (
  cls
  echo Windows version not supported for Windows Subsystem for Android.
  echo Your current Windows build is %check% meanwhile WSATools needs build 10.0.22000.282.
  echo Press any key to exit.
  del checkver.bat
  pause >nul
  cls
  exit
)