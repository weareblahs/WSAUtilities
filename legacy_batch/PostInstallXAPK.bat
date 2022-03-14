@echo off
echo Installation complete!
set /p var=Do you want to install other XAPK files? [Yes / (No)]: 
if %var%== Yes InstallXAPK
if %var%== yes InstallXAPK
else exit