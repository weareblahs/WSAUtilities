# wsatools
Tools for Windows Subsystem for Android™ that only uses batch scripts and command line-based softwares.

## Requirements
 - Windows 11 computer (of course)
 - Processor with Virtualization support
 - Basic requirements of Windows 11 PC ([here](https://www.microsoft.com/en-us/windows/windows-11-specifications#table2))
## Download
See https://github.com/weareblahs/wsatools/releases.

## InstallWSA
This script is a batch script that installs Windows Subsystem for Android that runs on Windows 11 devices. Script based on [these instructions](https://www.reddit.com/r/Windows11/comments/qc6z0w/windows_subsystem_for_android_for_dev_channel/) by Reddit user u/Coxxs.

Saw "Enter the URL here" and don't know what to do? Here's how to get it:
1. Go to https://store.rg-adguard.net/
2. Enter these parameters:

| URL                                                    | Channel |
|--------------------------------------------------------|---------|
| https://www.microsoft.com/store/productId/9P3395VX91NR | Slow    |

3. Find the `.msixbundle file`, right click, then "Copy link address".
4. Paste it at the command window.

## InstallAPK
This script installs APK files through ADB (`platform-tools` to be specific) with a wizard-like interface. You need to drag and drop the APK to the command prompt window.

## TODO: Fixes and Improvements
 - Turn Windows Features On or Off in batch script (WSAInstall)
 - curl: https://store.rg-adguard.net/api/GetFiles (POST?) and get MSIX URL. Currently guiding users who uses this script to copy the link from https://store.rg-adguard.net/. (WSAInstall)
   - Using a mirror on Google Drive / s-ul.eu could work on this case?
 - Check if using Windows 11. Accepting versions starting `22*.*` (WSAInstall)
