@echo off
@setlocal enableextensions
@cd /d "%~dp0"
:: Language setup
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA enablevm')do set enablevm=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA postinstall1') do set postinstall1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA postinstall2') do set postinstall2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni yes') do set yes=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni no') do set no=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni selectprompt') do set selectprompt=%%i >nul
:: Technically no new strings, proceed to the script

echo %enablevm%
dism /online /Enable-Feature /FeatureName:VirtualMachinePlatform /All
:finish
echo %ic1%
echo %postinstall1%
echo %postinstall2%
echo [Y]: %yes%
echo [N]: %no%
set /p restartprompt=%selectprompt% 
if %restartprompt%== 1 shutdown /r /t 0 /d WSAUtilities Restart
if %restartprompt%== 2 exit
pause
exit