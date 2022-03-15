import configparser
from clint.textui import progress
import os
import conadb
from pyaxmlparser import APK
import os
import urllib.request
import adbutils
from ppadb.client import Client as AdbClient
import time

config = configparser.ConfigParser()
config.read('WSAU.ini')
mslauncherurl = config['MicrosoftLauncher']['URL']
print("If you want the newest Microsoft Launcher version, please replace the URL of Microsoft Launcher on WSA.ini. You can also download the APK file then move it to the temp folder.")
input("Press Enter to continue downloading.")
path = 'temp/msl.apk'
app = APK(path)
if os.path.exists(path):
    print("It looks like you've downloaded it before. Going to install process...")
else:
    print('Starting download...')
    urllib.request.urlretrieve(mslauncherurl, path)
    print('Download complete! Connecting to Windows Subsystem for Android machine...')
    os.system('cmd /k "WsaClient.exe /start"') 
    print('Connecting WSA machine through ADB...')
conadb.main()

client = AdbClient(host="127.0.0.1", port=5037)
devices = client.devices()

for device in devices:
    AuroraStoreCheck = str(device.is_installed("com.microsoft.launcher"))

if AuroraStoreCheck == "False":
    print("Installing " + app.application + " (" + app.version_name + ")...")
elif AuroraStoreCheck == "True":
    print("Updating " + app.application + " to version " + app.version_name + "...")

for device in devices:
    device.install(path)

for device in devices:
    FinalCheck = str(device.is_installed("com.microsoft.launcher"))

if FinalCheck == "True":
    print("Installation successful! Going back to menu in 5 seconds...")
    time.sleep(5)
    os.system('cls')
    exec(open("CliLauncher.py").read())
if FinalCheck == "False":
    print("Installation failed. Going back to menu in 5 seconds...")
    time.sleep(5)
    os.system('cls')
    exec(open("CliLauncher.py").read())