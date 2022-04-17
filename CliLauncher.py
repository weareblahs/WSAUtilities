import configparser
import keyboard
import time
import os

config = configparser.ConfigParser()
configL = configparser.RawConfigParser()
write_config = configparser.ConfigParser()
config.read('WSAU.ini')
name = config['VersionInfo']['ProductName']
codename = config['VersionInfo']['Codename']
ver = config['VersionInfo']['Version']

config.read('WSAU_user.ini')
version_comp = config['System']['supported']

os.system('cls')

if(version_comp == "true"):
    print('')
else:
    print("It looks like you haven't check if your Windows version is compatible with Windows Subsystem for Android yet. To check, press 0.")

print(f'{name} ({ver} {codename}) command line menu')
print('')
print(
    '''
    [1]: Install Windows Subsystem for Android [InstallWSA]
    [2]: Install APK on Windows Subsystem for Android [InstallAPK]
    [3]: Install XAPK files downloaded from APKPure [InstallXAPK]

    Additional options:
    [A1]: Install Aurora Store
    [A2]: Install Microsoft Launcher

    [M]: Diagnostics

    [Q]: Exit WSAUtilities
    '''
)
print('')
selection = input("Please choose your selection and press ENTER: ")

if selection=="0":
    os.system('cls')
    exec(open("DeviceCheck.py").read())

elif selection=="1":
    os.system('cls')
    exec(open("InstallWSA.py").read())

elif selection=="2":
    exec(open("InstallAPK.py").read())

elif selection=="3":
    exec(open("InstallXAPK.py").read())

elif selection=="A1":
    exec(open("InstallAurora.py").read())

elif selection=="a1":
    exec(open("InstallAurora.py").read())

elif selection=="A2":
    os.system('cls')
    exec(open("InstallMicrosoftLauncher.py").read())

elif selection=="a2":
    os.system('cls')
    exec(open("InstallMicrosoftLauncher.py").read())
    
elif selection=="M":
    os.system('cls')
    exec(open("Diagnostics.py").read())

elif selection=="m":
    os.system('cls')
    exec(open("Diagnostics.py").read())

elif selection=="Q":
    quit()

elif selection=="q":
    quit()