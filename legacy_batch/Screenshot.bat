@echo off
@Screenshot
echo Windows Subsystem for Android Screenshot tool
echo This script screenshots your current WSA screen. Currently supported if running 1 app.
echo Please make sure that ADB (Developer Tools) is enabled.
echo If enabled, press any key.
pause >nul
goto start

:start
set /P png=Enter output path / filename here. If you enter only filename, then the screenshot will be saved on the "main" folder: 
echo When you're ready, press any key to start screenshot.
pause >nul
adb exec-out screencap -p > %png%
goto end

:end
echo Screenshot capture complete!
set /p var=Do you want to take another screenshot? [Yes (Y) / No (N)]: 
if %var%== Yes GOTO start
if %var%== yes GOTO start
if not %var%== No exit