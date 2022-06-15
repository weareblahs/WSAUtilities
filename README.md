# WSAUtilities

Tools for Windows Subsystem for Android™ that only uses Python and batch scripts and command line-based softwares. Was WSAtools once, but not the APK installer on Windows Store.

# How to use it?
Download it from the "Releases" page ([link for lazy people](https://github.com/weareblahs/WSAUtilities/releases)) and extract the entire ZIP file to a directory.
- If you're running WSAUtilities for the first time, then you have to run `PreSetup.bat` to check if you have Python and all the prerequisites installed. 
  - If prerequisites isn't installed, the script will attempt to install all required prerequisites from `pip`.
  - If Python isn't installed, the script will self-exit. You have to download Python through the Microsoft Store. Note that I do not gurantee proper usage if installed through the Python Downloads page (although I gurantee that this Python version worked well than the Microsoft Store version) unless you follow these steps from this [Stack Overflow page](https://stackoverflow.com/questions/58754860/cmd-opens-window-store-when-i-type-python)
- **Make sure to check if your Windows version supports WSAUtilities or not.** When arriving at the WSAUtilities launcher, press `0` as prompted.
- Have this script but not Windows Subsystem for Android? 
# Disclaimer
**This project isn't affliated with either Microsoft Corporation or Google!** Although this code is licensed under MIT License, the licenses for other feature still remain on these companies, such as `InstallWSA`, which uses `store.rg-adguard.net`'s API to get the Microsoft Store link for the WSA package'.
# Features (and other stuffs you might care of when using these features)
| Feature Name                           | Feature Description                                           | Admin Access? | Feature type            | Third-party tools / Python packages used (if any)                         | Other notes?                                                                         | Script based on |
|----------------------------------------|---------------------------------------------------------------|---------------|-------------------------|---------------------------------------------------------------------------|--------------------------------------------------------------------------------------|-----------------|
| CliLauncher                            | Launcher for other WSAUtilities tools                         |               | Feature                 | configparser, keyboard, time, os, webbrowser                              |                                                                                      | Python          |
| DeviceCheck                            | Checks if computer is compatible with WSA.                    |               | Function                | platform, configparser, time                                              | Currently only checks for OS version. Other options coming soon.                     | Python          |
| Diagnostics                            | Diagnostics for WSA internals, such as backend controls.      |               | Submenu for CliLauncher | configparser, os                                                          | Android System Info coming soon.                                                     | Python          |
| InstallAPK                             | Installs APK through ADB.                                     |               | Feature                 | tkinter, adbutils, ppadb, os, pyaxmlparser                                | Migration to native `adb.exe` coming soon.                                           | Python / Batch  |
| InstallAurora InstallMicrosoftLauncher | Installs the latest version of the apps mentioned.            |               | Subfeature              | os, time, adbutils, ppadb, clint                                          | Note that I'll update the Microsoft Launcher version in my own OneDrive every month. | Python          |
| InstallWSA                             | Installs the latest version of Windows Subsystem for Android. | ✓             | Feature                 | UAC, os, urllib, requests, bs4, pathlib, hurry.filesize, clint, packaging |                                                                                      | Python / Batch  |
| InstallXAPK                            | Installs XAPK files downloaded from APKPure.                  |               | Feature                 | tkinter, adbutils, ppadb, os, pyaxmlparser, time, urllib, zipfile, glob   | Needs download of platform-tools before running for the first time.                  | Python          |
| conadb                                 | Function for APK installation scripts.                        |               | Function                | adbutils                                                                  |                                                                                      | Python          |

# Looking for tools to add!
Other tools to add into this collection of WSAUtilities? Then sumbit an issue with the tag "New Feature".

# WIP / Future fixes and improvements
None.