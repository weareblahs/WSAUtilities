# Windows Subsystem for Android unofficial installer
This script is a batch script that installs Windows Subsystem for Android that runs on Windows 11 devices. Script based on [these instructions](https://www.reddit.com/r/Windows11/comments/qc6z0w/windows_subsystem_for_android_for_dev_channel/) by Reddit user u/Coxxs.

# TODO
 - Turn Windows Features On or Off in batch script
 - curl: https://store.rg-adguard.net/api/GetFiles (POST?) and get MSIX URL. Currently guiding users who uses this script to copy the link from https://store.rg-adguard.net/.
   - Using a mirror on Google Drive / s-ul.eu could work on this case?
 - Check if using Windows 11. Accepting versions starting `22*.*`
   
# How this works - a teardown
```batch
aria2c -x 16 -s 16 -o wsa_installation.msix "%url%"
```
This uses `aria2c` to download the WSA URL the user provided in 16 connections, which accerlates the download. The URL provided by the user is stored on a variable.
Want to change to your preferred downloader? Then change the command to `curl -o wsa_installation.msix "%url%"` or `wget -O wsa_installation.msix "%url%"`. Use your own command? then make sure the URL part is set to `%url%` and that's all. Put quotes before and after the URL (example: `"%url%"`) if you want to do that.
```powershell
powershell Add-AppxPackage -Path wsa_installation.msix
```
This uses `PowerShell` to add (install) the downloaded package to the computer.

## Requires Admin Elevation
This script checks if you've "runned as admin" by default so the installation can be more easier.

## Prerequisites
 - Aria2 ([download here](https://github.com/aria2/aria2/releases/tag/release-1.36.0) and extract the `aria2c.exe` file to the directory where `wsa.bat` is located)
 - Windows 11 PC
 
## How to use?
1. Go to https://store.rg-adguard.net/ then enter the following parameters:
   - Select "URL (link)" at first dropdown
   - Type "https://www.microsoft.com/store/productId/9P3395VX91NR" as URL
   - Select "Slow" at the second dropdown ("RP" is default, which means Release Preview, which WSA isn't available there)
2. Find `MicrosoftCorporationII.WindowsSubsystemForAndroid_1.7.32815.0_neutral_~_8wekyb3d8bbwe.msixbundle` or similiar ones with the `.msixbundle` extension
3. Right click > Copy Link Address
4. Run the script as administrator (Right click > Run as Administrator) then paste the URL, then press Enter and let it do the rest.
### Before you start testing - IMPORTANT
5. Press the Windows Key / go to Start then search for "turn windows features on or off".  
6. At the pop-up, enable "Virtual Machine Platform".  
7. Go back to Command Prompt and press any key to exit the installation script. Then, go back to the "Turn Windows features on or off" window.  
8. Follow the instructions on your computer to restart your computer. Remember to save your files on your PC.  
9. After restart, go to Start > Windows Subsystem for Android™ to configure settings for Windows Subsystem for Android.  

## Wait, how to download apps?
See [here](https://www.reddit.com/r/Windows11/comments/qcsx37/guide_how_to_install_aurora_store_via_sideloading/) for an alternative of Play Store (Aurora Store), which has most apps from Google Play, as WSA didn't support Google apps at this moment. Or, maybe try `adb install (APK filename)` on your PC if you actually have ADB (Platform Tools) on your PC. Or, if you are living in the US then you can try Amazon Appstore from the Start menu.

## Where are the apps?
Start Menu.
