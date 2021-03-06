@echo off
@setlocal enableextensions
@title InstallWSAMirror
@cd /d "%~dp0"
:: Language setup
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini Localization Language') do set lang=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni runasadmin') do set runasadmin=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA startintro') do set startintro=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA startintro2') do set startintro2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA urlprompt') do set urlprompt=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA postinstall1') do set postinstall1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA postinstall2') do set postinstall2=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA postinstall3') do set postinstall3=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA postinstall4') do set postinstall4=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA startdownload') do set startdownload=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA startinstall')do set startinstall=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA enablevm')do set enablevm=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni yes') do set yes=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni no') do set no=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni SelectPrompt') do set selectprompt=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni complete1') do set ic1=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini additional_uni startdownload') do set startdownload=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSAMirror space') do set space=%%i >nul
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini WSAMirror URL') do set url=%%i >nul
for /f "delims=" %%i in ('LocalVariables WSAUtilities.ini Downloading DlMethod') do set dlmethod=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA preacceptprompt') do set preacceptprompt=%%i >nul
for /f "delims=" %%i in ('LocalVariables lang\%lang:~0,2%.ini InstallWSA acceptprompt') do set acceptprompt=%%i >nul

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
echo %space%
echo pause
goto license

:license
echo %preacceptprompt%
type "lang\InstallWSAPreInstallInfo_%lang:~0,2%.txt"
set /P accept=%acceptprompt% [Y/N]
if %accept%==Y goto startdownload
if %accept%==y goto startdownload
if %accept%==N exit
if %accept%==n exit

:startdownload
echo %startdownload%
:: Change the line below to use a different installer.
if %dlmethod% == aria2c (
aria2c -x 16 -s 16 -o wsa_installation.msixbundle %url%
goto install
)
if %dlmethod% == wget (
wget -O wsa_installation.msixbundle %url%
goto install
)
if %dlmethod% == curl (
curl -o wsa_installation.msixbundle %url%
goto install
)

:install
echo %startinstall%
powershell Add-AppxPackage -Path wsa_installation.msixbundle

echo %enablevm%%
dism /online /Enable-Feature /FeatureName:VirtualMachinePlatform /All

echo %complete1%
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
