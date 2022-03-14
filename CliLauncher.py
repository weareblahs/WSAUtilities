import configparser
import keyboard
import time

config = configparser.ConfigParser()
configL = configparser.RawConfigParser()
write_config = configparser.ConfigParser()
config.read('WSAU.ini')
name = config['VersionInfo']['ProductName']
codename = config['VersionInfo']['Codename']
ver = config['VersionInfo']['Version']

config.read('WSAU_user.ini')
version_comp = config['System']['supported']
sel5 = "A1"
sel6 = "A2"
sel7 = "M"

if(version_comp == "true"):
    print('')
else:
    print("It looks like you haven't check if your Windows version is compatible with Windows Subsystem for Android yet. To check, press 0.")

print(f'{name} ({ver} {codename}) command line menu')
print('')
print(
    '''
    [1]: Install Windows Subsystem for Android [InstallWSA]
    [2]: Install Windows Subsystem for Android [InstallWSAMirror]
    [3]: Install APK on Windows Subsystem for Android [InstallAPK]
    [4]: Install XAPK files downloaded from APKPure [InstallXAPK]

    Additional options:
    [A1]: Install Aurora Store
    [A2]: Install Microsoft Launcher

    [M]: Diagnostics
    '''
)
print('')
selection = input("Please choose your selection and press ENTER: ")

if selection=="0":
    exec(open("DeviceCheck.py").read())

elif selection=="1":
    exec(open("InstallWSA.py").read())

elif selection=="2":
    exec(open("InstallWSAMirror.py").read())

elif selection=="3":
    exec(open("InstallAPK.py").read())

elif selection=="4":
    exec(open("InstallXAPK.py").read())

elif selection==sel5.lower():
    exec(open("InstallAurora.py").read())

elif selection==sel5:
    exec(open("InstallAurora.py").read())

elif selection==sel6.lower():
    exec(open("InstallMicrosoftLauncher.py").read())

elif selection==sel6:
    exec(open("InstallMicrosoftLauncher.py").read())
    
elif selection==sel7.lower():
    exec(open("DiagMenu.py").read())

elif selection==sel7:
    exec(open("DiagMenu.py").read())