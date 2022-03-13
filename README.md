# WSAUtilities

Tools for Windows Subsystem for Android™ that only uses batch scripts and command line-based softwares. Was WSAtools once, but not the APK installer on Windows Store.

## WIP

## Python migration

This repository is now under Python migration. This means:

- Existing scripts will be converted into Python scripts

- Scripts under releases will be repackaged as Windows executables

- Other external tools will be eliminated as much as possible by using its Python equivalents (example: ``aria2p`` will be replacing ``aria2c``)

- PowerShell scripts will still be runned as normal (post-download for InstallWSA)

- GUI launcher / installer

- Configuration file can be configured through ``Configuration.py``

After migration completed, all the batch files will be archived and new features will be developed soon.

### New stuffs

- One-click installer for InstallWSAMirror through IExpress
  - Original InstallWSAMirror GUI won't be made due to the software that I'm using to make (Advanced Installer) is for PC software installers.
- Diagnostics page
  - Advanced options, example: Start / Restart WSA client

## Suggestions?

If you're trying to suggest something, you can suggest it [here](https://forms.gle/Cpaew55sYPZRB36Z9) or you can create an issue regarding to your suggestion.

### Planned but not confirmed

- GUI Launcher
  
  # Running the latest dev build but it just quits?
- Modify `WSAUtilities.ini` under the `main` folder:
  - Find the "`Devbuild`" line, then change the property to the dev build number (example: 22538)
  - Save it, then run `WSAUtilitiesLauncher.bat` on the root folder.
- Let patch replace it for you:
  - Find a file called `patch_XXXXX.bat` (`XXXXX` is the build number, example: 22538)
    
    ## Still won't work?
    
    **This method doesn't gurantee that it will work on all machines, especially older Windows builds.**
- Try running `WSAUtilities.bat` under the `main` folder.
  
  # NEW: Build offline version of InstallWSA with OfflineInstallWSA (separate)
  
  This option doesn't download WSAUtilities on your PC, but instead, it just downloads and installs Windows Subsystem for Android on PCs. See [here](https://github.com/weareblahs/WSAUtilities/discussions/14) for more info.
  
  # For new users
  
  Before you do anything with it, remember that **This thing only works with Windows 11 computers**.  
  
  ## Where to download?
  
  https://github.com/weareblahs/WSAUtilities/releases, then download the newest ZIP file.

# For users using dev builds of Windows 11

The devbuild is included in the config file of WSAUtilities in order to be used with WSAUtilitiesLauncher. The latest update will include the latest dev build as listed on Microsoft's website. ~~Don't tell anyone that I'm on Beta channel of Windows Insider~~

## I saw the pop-up (like the one shown below) and WSA refuses to start. What should I do?

![image](https://user-images.githubusercontent.com/37889443/150119318-e26f3c23-e98f-4c5c-9f23-b1196696ec59.png)  
If you're seeing this, that means that there's a problem with my script or you disabled Virtual Machine Platform (most possible: BlueStacks or other Android emulators want you to disable it). Here's how to fix it:

- Download, extract and run the latest version of WSAUtilities.
- Run WSAUtilities as usual, then type "A3" to enable Virtual Machine Platform.
- After enabling, it will prompt you to restart your computer. You can either manually restart your computer, or select "Y" and let WSAUtilities do the rest.
  
  ## Which build / version of Windows 11 will the WSAUtilitiesLauncher script detect?
- Windows 11 Build 22000 (any versions) [Beta / Stable]
- Windows 11 Build 22523 (any versions) [Dev build]  
  - To run under Build 22526 of the Dev build, simply download `patch_dev22526.bat` under "Releases", copy to the root WSAUtilities folder then run it.
    Builds other than this (including 21996) will be ignored from running this script. To test other unstable versions, modify WSAUtilities.ini to let it detect your Windows 11 build version.

### Translators required!

I'm currently migrating all the build numbers / build versions / localization stuffs / options to a INF file, which lets me put multilanguage as an option. Please note that some Asian languages (Japanese / Chinese) won't be supported since there's some limitations with Command Prompt on this kind of stuffs, even running `chcp (code)` before running script.  
Translators credits can be seen [here](https://github.com/weareblahs/WSAUtilities/blob/main/lang/LanguageCredits.md)

#### Wait, how to translate?

See [here](https://github.com/weareblahs/WSAUtilities/blob/main/lang/TranslationGuide.md)

## Credits

Special thanks to Simone Franco, the developer of WSATools for this new name.

### Software credits

- NirCmd courtesy of NirSoft
- Aria2 made by Tatsuhiro Tsujikawa (Lead developer)
  - Original repository: https://github.com/aria2/aria2/tree/release-1.24.0
- FART (Find and Replace Text)
  - Original source code from https://sourceforge.net/projects/fart-it/
  - Improved by lionello in GitHub (https://github.com/lionello/fart-it)
  - Compiled by me (https://github.com/weareblahs/fart-builds/releases/tag/v1.99c)
- 7-zip (Command line parts only)
  - Source code on https://sourceforge.net/projects/sevenzip/files/7-Zip/
- Microsoft for Windows Subsystem for Android
- Wget
  - Source code on https://savannah.gnu.org/git/?group=wget

## Disclaimer

This project isn't affliated with either Microsoft Corporation and Google.

### Looking for tools to add!

Other tools to add into this collection of WSAUtilities? Then sumbit an issue with the tag "New Feature".

## Requirements

- Windows 11 computer (of course)
  - Script only runs if you're using Windows 11 version 22000 or above. As said, the "leaked" Win11 version (21996) won't work on this script. You can check your build number by `Win+R` then type `winver`. See image below if you still didn't know where's the build number:  
    ![image](https://user-images.githubusercontent.com/37889443/139691468-683cc9d7-38fc-4532-9f4b-cd2ac5c9c73f.png)
- Processor with Virtualization support
  - This is a basic requirement of emulating some Linux-based OSes. If you used Bluestacks / Nox or other Android emulator before, you probably turned it on before.
- Basic requirements of Windows Subsystem for Android ([here](https://www.microsoft.com/en-us/windows/windows-11-specifications#table2))

## Download

See https://github.com/weareblahs/WSAUtilities/releases.

## InstallWSA

This script is a batch script that installs Windows Subsystem for Android that runs on Windows 11 devices. Script based on [these instructions](https://www.reddit.com/r/Windows11/comments/qc6z0w/windows_subsystem_for_android_for_dev_channel/) by Reddit user u/Coxxs.

Saw "Enter the URL here" and don't know what to do? Here's how to get it:

1. Go to https://store.rg-adguard.net/
2. Enter these parameters:

| URL                                                    | Channel |
| ------------------------------------------------------ | ------- |
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

Version on my cloud drive: `1.2.32828.0`

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

- [x] Name change migration from WSAtools to WSAUtilities (Finished since v0.0.9)
- [x] Turn Windows Features On or Off in batch script (WSAInstall) (Now uses DISM to turn it on.)
- [ ] curl: https://store.rg-adguard.net/api/GetFiles (POST?) and get MSIX URL. Currently guiding users who uses this script to copy the link from https://store.rg-adguard.net/. (InstallWSA)
- [x] Alternate mirror option: Using a mirror on Google Drive / s-ul.eu could work on this case? (WSAMirror) (OneDrive Mirror option added)
- [x] Check if using Windows 11. Accepting versions starting `22*.*` (See v0.0.6. Added checks before running WSAUtilities as launcher. (WSAUtilitiesLauncher) See [here](https://dev.to/weareblahs/i-found-it-the-most-complex-way-to-check-operating-system-build-number-before-running-an-batch-script-1cmc) for explaination).
- [x] XAPK Installation (See v0.0.3 for initial version. (InstallXAPK))
- [ ] Screenshot does not work at this moment as it returns white screen on output PNG file (Screenshot / ScreenshotDT)
- [x] Multilanguage (Multilanguage system finished. Now waiting for people to contribute translation through pull requests)
- [x] Installation falied for other packages other than the main one (InstallXAPK) (Fixed on v0.0.9)
- [x] Install Aurora + Microsoft Launcher post-install (InstallWSA / InstallWSAMirror / Standalone Script) (See v0.0.9b)
- [x] Migrate all config stuffs to `WSAUtilities.inf` (Migration complete. See 0.0.9.)
