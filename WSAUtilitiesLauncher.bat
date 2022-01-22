@echo off
@title WSAUtilitiesLauncher
:: Lang import
for /f "delims=" %%i in ('main\LocalVariables main\WSAUtilities.ini Localization Language') do set lang=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\lang\%lang:~0,2%.ini WSAUtilitiesLauncher intro1') do set intro1=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\lang\%lang:~0,2%.ini WSAUtilitiesLauncher intro2') do set intro2=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\lang\%lang:~0,2%.ini WSAUtilitiesLauncher supported1') do set supported1=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\lang\%lang:~0,2%.ini WSAUtilitiesLauncher s1') do set 3s=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\lang\%lang:~0,2%.ini WSAUtilitiesLauncher s2') do set 2s=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\lang\%lang:~0,2%.ini WSAUtilitiesLauncher s3') do set 1s=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\lang\%lang:~0,2%.ini WSAUtilitiesLauncher error1') do set failed1=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\lang\%lang:~0,2%.ini WSAUtilitiesLauncher error2') do set failed2=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\lang\%lang:~0,2%.ini WSAUtilitiesLauncher error3') do set failed3=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\lang\%lang:~0,2%.ini WSAUtilitiesLauncher error4') do set failed4=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\lang\%lang:~0,2%.ini WSAUtilitiesLauncher error5') do set failed5=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\lang\%lang:~0,2%.ini WSAUtilitiesLauncher error6') do set failed6=%%i >nul

:: Version import
for /f "delims=" %%i in ('main\LocalVariables main\WSAUtilities.ini Launcher Current') do set current=%%i >nul
for /f "delims=" %%i in ('main\LocalVariables main\WSAUtilities.ini Launcher Devbuild') do set devbuild=%%i >nul


:: Start text
echo %intro1%
echo %intro2%
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
for /f "delims=" %%i in ('checkver') do set check=%%i >nul
for /f "delims=" %%i in ('echo %check:~5,5%') do set check2=%%i >nul
if %check2% == %current% (
:: Success screen
  cls
  echo %supported1%
  echo %3s%
  timeout 1 > NUL
  cls
  echo %supported1%
  echo %2s%
  timeout 1 > NUL
  cls
  echo %supported1%
  echo %1s%
  timeout 1 > NUL
  del checkver.bat
  cls
  cd main
  WSAUtilities
)
if %check2% == %devbuild% (
:: Success screen
  cls
  echo %supported1%
  echo %3s%
  timeout 1 > NUL
  cls
  echo %supported1%
  echo %2s%
  timeout 1 > NUL
  cls
  echo %supported1%
  echo %1s%
  timeout 1 > NUL
  del checkver.bat
  cls
  cd main
  WSAUtilities
) else (
:: Failed screen
  cls
  echo %failed1%
  echo %failed2%
  echo %failed3%
  echo %failed4%
  echo %failed5%
  echo %failed6%
  del checkver.bat
  pause >nul
  cls
  exit
)
