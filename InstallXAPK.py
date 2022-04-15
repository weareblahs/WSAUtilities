from tkinter import filedialog
from tkinter import *
import adbutils
from ppadb.client import Client as AdbClient
import os
import conadb
from pyaxmlparser import APK
import time
import urllib
import zipfile
import glob

adbpath = "winadb\platform-tools\adb.exe"

# platform-tools downloading dialog start
if not os.path.exists(adbpath):
    print('platform-tools is required before installing XAPKs.')
    print('Please accept the Android Software Development Kit Terms and Conditions before downloading.')
    print('See https://developer.android.com/studio/terms for full terms and conditions.')
    start_download_prompt = input("Do you want to start the download? [Y/N]: ")
    if start_download_prompt == "Y":
            print('Starting download, please wait...')
            urllib.request.urlretrieve("https://dl.google.com/android/repository/platform-tools-latest-windows.zip", "platform-tools_temp.zip")
            print('Extracting platform-tools...')
            with zipfile.ZipFile("platform-tools_temp.zip", 'r') as zip_ref:
                zip_ref.extractall("winadb")
            print("Extracting complete!")
            os.system('pause')
    if start_download_prompt == "y":
            print('Starting download, please wait...')
            urllib.request.urlretrieve("https://dl.google.com/android/repository/platform-tools-latest-windows.zip", "platform-tools_temp.zip")
            print('Extracting platform-tools...')
            with zipfile.ZipFile("platform-tools_temp.zip", 'r') as zip_ref:
                zip_ref.extractall("winadb")
            print("Extracting complete!")
            os.system('pause')
else:
    print('platform-tools downloaded! Proceeding to InstallXAPK...')
# platform-tools downloading dialog end

startwsaml = """Starting Windows Subsystem for Android before installation...
Stuck at this step? Close this window and open again."""
print(startwsaml)
os.system('WsaClient.exe /start') 
os.system('cls')
print('Select the APK file from the popup. After selecting, it will start the install process.')

tk = Tk()
tk.filename = filedialog.askopenfilename(initialdir = "/",title = "Select XAPK file",filetypes = (("APKPure Bundle","*.xapk"),("all files","*.*")))

filename = str(tk.filename)
with zipfile.ZipFile(filename, 'r') as zip_ref:
     zip_ref.extractall("xapktemp")
preextractfilepath = str(os.listdir("xapktemp")[0])
files = str(' '.join(glob.glob('xapktemp/*.apk')))
preextractcompat = "xapktemp/" + preextractfilepath
app = APK(preextractcompat)
print ("Parsing app information...")
appname = str(app.application)
packagename = str(app.package)
version = str(app.version_name)
os.system('cls')
print("App name: " + appname)
print("App package name: " + packagename)
print("App version: " + version)
print("Do you want to install the following app? [Y/N]")
selection = input("Please choose your selection and press ENTER: ")

if selection == "Y":
    print('Installation process started.')
if selection == "y":
    print('Installation process started.')
if selection == "N":
        exec(open("CliLauncher.py").read())
if selection == "n":
        exec(open("CliLauncher.py").read())

print('Connecting WSA machine through ADB...')
conadb.main()
# ADB client for checking usage
client = AdbClient(host="127.0.0.1", port=5037)
devices = client.devices()

# ADB client for installation usage (platform-tools)
os.system("winadb\platform-tools\adb connect localhost:58526")

for device in devices:
    FirstCheck = str(device.is_installed(app.package))
if FirstCheck == "False":
    print("Installing " + app.application + " (" + app.version_name + ")...")
elif FirstCheck == "True":
    print("Updating " + app.application + " to version " + app.version_name + "...")
# Start installing bundle
os.system("adb install-multiple " + files)
for device in devices:
    FinalCheck = str(device.is_installed(app.package))
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