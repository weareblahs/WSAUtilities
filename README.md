# WSAtools
Tools for Windows Subsystem for Android™ that only uses batch scripts and command line-based softwares.

# Needs improvement!
Do you think I should do a WSAtools version for Insider Dev Channels? (The WSAToolsLauncher script will check for the latest insider version)
Vote here: https://linkto.run/p/T1HT6MJB
## Before you use
If you're looking for a GUI app installer for WSA, this isn't the WSAtools you're looking for. You might be looking for Simone Franco's WSATools, and this just shares the same name of it, and I just noticed just now when doing a random search with Google. I'm not affliated with that project.  
  
Download the WSATools you're searching for at https://www.microsoft.com/en-us/p/wsatools/9n4p75dxl6fg.
### Looking for tools to add!
Other tools to add into this collection of WSATools? Then sumbit an issue with the tag "New Feature".

## Requirements
 - Windows 11 computer (of course)
   - Script only runs if you're using Windows 11 version 22000.282. You can check your build number by `Win+R` then type `winver`. See image below if you still didn't know where's the build number:  
   ![image](https://user-images.githubusercontent.com/37889443/139691468-683cc9d7-38fc-4532-9f4b-cd2ac5c9c73f.png)
 - Processor with Virtualization support
   - This is a basic requirement of emulating some Linux-based OSes. If you used Bluestacks / Nox or other Android emulator before, you probably turned it on before.
 - Basic requirements of Windows Subsystem for Android ([here](https://www.microsoft.com/en-us/windows/windows-11-specifications#table2))
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

### For your information
For verification of checksum of the file to ensure that you downloaded the `.msixbundle` file correctly, the SHA256 checksum of version `1.7.32815.0` is `ee2e71e844a491c4f0ff371bfa641447bc036ad3b7a57a319cc6673b97c345c4`. You can check it by right-clicking the downloaded file and select `CRC SHA` then select `SHA256` then compare it.  
  
Currently planning to add hash verification using hashsum.bat.

### How to fix the "Virtual Machine Platform" error?
1. Go to "Search" (or keyboard shortcut Win+S), then type in "Turn Windows Features On or Off".
2. Find "Virtual Machine Platform" and enable it.
3. Restart your computer.

## InstallWSAMirror
Installs Windows Subsystem for Android from a OneDrive mirror hosted by me. Please note that this mirror may exceed OneDrive's download quota.  
  
Version on my cloud drive: `1.2.32822.0 (9/11/2021)`

## InstallAPK
This script installs APK files through ADB (`platform-tools` to be specific) with a wizard-like interface. You need to drag and drop the APK to the command prompt window.

Here's how to use it:
1. Run Windows Subsystem for Android™, then click "Files". This triggers ADB to be active. Then, turn on "Developer mode". on the Windows Subsystem for Android window.
2. Drag and drop the APK file to the command prompt window.
3. Press "Enter".
4. Let it install.
5. If you want to install another APK, type "Yes" then press "Enter".

## InstallXAPK
This script installs XAPK (base + language files) with a wizard-like interface. You need to drag and drop the XAPK file to the command prompt window. The script didn't support XAPKs with OBBs at this moment.

Here's how to use it:
1. Run Windows Subsystem for Android™, then click "Files". This triggers ADB to be active. Then, turn on "Developer mode". on the Windows Subsystem for Android window.
2. Drag and drop the APK file to the command prompt window.
3. Press "Enter".
4. Let it install.

Future releases will include OBB extraction and installation.

## Screenshot / ScreenshotDT
Screenshot through ADB for Windows Subsystem for Android apps. DRM-protected contents will show as black screen like other normal Android devices.

**ScreenshotDT**: Same as `Screenshot` but outputs date and time (Default format in batch file: DDMMYYYY HHMMSS. You can change it.)

## UpdateWSA
Checks for updates of Windows Subsystem for Android.

## TODO: Fixes and Improvements
 - ~Turn Windows Features On or Off in batch script (WSAInstall)~
   - Currently working on this. Stay tuned.
 - curl: https://store.rg-adguard.net/api/GetFiles (POST?) and get MSIX URL. Currently guiding users who uses this script to copy the link from https://store.rg-adguard.net/. (WSAInstall)
   - ~~Using a mirror on Google Drive / s-ul.eu could work on this case?~~ Mirror option added (WSAMirror)
 - ~Check if using Windows 11. Accepting versions starting `22*.*`~ See v0.0.6. Added checks before running WSATools as launcher. See [here](https://dev.to/weareblahs/i-found-it-the-most-complex-way-to-check-operating-system-build-number-before-running-an-batch-script-1cmc) for explaination. (WSAToolsLauncher)
 - ~~XAPK Installation~~ See v0.0.3 for initial version. (InstallXAPK)
 - Screenshot does not work at this moment as it returns white screen on output PNG file (Screenshot / ScreenshotDT)
 - Multilanguage
 - Installation falied for other packages other than the main one (InstallXAPK)
 - Install Aurora + Microsoft Launcher post-install (InstallWSA / InstallWSAMirror / Standalone Script)
