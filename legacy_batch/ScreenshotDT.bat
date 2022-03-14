@echo off
@ScreenshotDT
echo Windows Subsystem for Android Screenshot tool
echo This script screenshots your current WSA screen. Currently supported if running 1 app.
echo Please make sure that ADB (Developer Tools) is enabled.
echo If enabled, press any key.
pause >nul
goto start

:start
set /P png=Enter directory on where you want to screenshot:
:prestart
echo When you're ready, press any key to start screenshot.
pause >nul

:: There you go. Adjust the properties below as you want.
adb exec-out screencap -p > "%date:~4,2%%date:~7,2%%date:~10,4% %time:~0,2%%time:~3,2%%time:~6,2%.png"
goto end

:end
echo Screenshot capture complete!
set /p var=Do you want to take another screenshot? [Yes (Y) / No (N) / Without output prompt (W)]: 
if %var%== Yes goto start
if %var%== yes goto start
if %var%== Y goto start
if %var%== W goto prestart
if not %var%== No exit