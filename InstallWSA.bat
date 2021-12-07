@echo off
@setlocal enableextensions
@cd /d "%~dp0"
:: Language setup
for /f "delims=" %%i in ('LocalVariables WSATools.ini Localization Language') do set lang=%%i >nul
for /f "delims=" %%i in ('LocalVariables WSATools.ini Localization Language') do set lang=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini additional_uni runasadmin') do set runasadmin=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini InstallWSA startintro') do set startintro=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini InstallWSA startintro2') do set startintro2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini InstallWSA urlprompt') do set urlprompt=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini InstallWSA postinstall1') do set postinstall1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini InstallWSA postinstall2') do set postinstall2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini InstallWSA postinstall3') do set postinstall3=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini InstallWSA postinstall4') do set postinstall4=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini InstallWSA startdownload') do set startdownload=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini InstallWSA startinstall')do set startinstall=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini InstallWSA enablevm')do set enablevm=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini additional_uni yes') do set yes=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini additional_uni no') do set no=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini additional_uni SelectPrompt') do set selectprompt=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\en.ini additioanl_uni complete1') do set ic1=%%i >nul
goto prestart
:: The following lines are used to check admin access.
:prestart
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    GOTO start
) ELSE (
    ECHO %runasadmin%
    pause
    exit
)

:start
echo %startintro%
echo %startintro2%
set /P url=%urlprompt%

echo %startdownload%
aria2c -x 16 -s 16 -o wsa_installation.msixbundle "%url%"

echo %startinstall%
powershell Add-AppxPackage -Path wsa_installation.msixbundle

echo %enablevm%
dism /online /Enable-Feature /FeatureName:VirtualMachinePlatform /All

echo %ic1%
echo %postinstall1%
echo %postinstall2%
echo %postinstall3%
echo %postinstall4%
echo [Y]: %yes%
echo [N]: %no%
set /p restartprompt=%selectprompt% 
if %restartprompt%== 1 shutdown /r /t 0 /d WSATools Restart
if %restartprompt%== 2 exit
pause
exit
