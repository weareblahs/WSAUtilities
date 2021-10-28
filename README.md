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

### How to fix the "Virtual Machine Platform" error?
1. Go to "Search" (or keyboard shortcut Win+S), then type in "Turn Windows Features On or Off".
2. Find "Virtual Machine Platform" and enable it.
3. Restart your computer.

## InstallWSAMirror
Installs Windows Subsystem for Android from a OneDrive mirror hosted by me. Please note that this mirror may exceed OneDrive's download quota.  
  
Version on my cloud drive: `1.7.32815.0 (28/10/2021)`

## InstallAPK
This script installs APK files through ADB (`platform-tools` to be specific) with a wizard-like interface. You need to drag and drop the APK to the command prompt window.

Here's how to use it:
1. Run Windows Subsystem for Android™, then click "Files". This triggers ADB to be active. Then, turn on "Developer mode". on the Windows Subsystem for Android window.
2. Drag and drop the APK file to the command prompt window.
3. Press "Enter".
4. Let it install.
5. If you want to install another APK, type "Yes" then press "Enter".

## TODO: Fixes and Improvements
 - Turn Windows Features On or Off in batch script (WSAInstall)
 - curl: https://store.rg-adguard.net/api/GetFiles (POST?) and get MSIX URL. Currently guiding users who uses this script to copy the link from https://store.rg-adguard.net/. (WSAInstall)
   - ~~Using a mirror on Google Drive / s-ul.eu could work on this case?~~ Mirror option added
 - Check if using Windows 11. Accepting versions starting `22*.*` (WSAInstall)
