# wsatools
Tools for Windows Subsystem for Android™ that only uses batch scripts and command line-based softwares.

## Download
See https://github.com/weareblahs/wsatools/releases.

## InstallWSA
This script is a batch script that installs Windows Subsystem for Android that runs on Windows 11 devices. Script based on [these instructions](https://www.reddit.com/r/Windows11/comments/qc6z0w/windows_subsystem_for_android_for_dev_channel/) by Reddit user u/Coxxs.

## InstallAPK
This script installs APK files through ADB (`platform-tools` to be specific) with a wizard-like interface. You need to drag and drop the APK to the command prompt window.

## TODO: Fixes and Improvements
 - Turn Windows Features On or Off in batch script (WSAInstall)
 - curl: https://store.rg-adguard.net/api/GetFiles (POST?) and get MSIX URL. Currently guiding users who uses this script to copy the link from https://store.rg-adguard.net/. (WSAInstall)
   - Using a mirror on Google Drive / s-ul.eu could work on this case?
 - Check if using Windows 11. Accepting versions starting `22*.*` (WSAInstall)
