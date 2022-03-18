from tkinter import filedialog
from tkinter import *
import adbutils
from ppadb.client import Client as AdbClient
import os
import conadb
from pyaxmlparser import APK
import time
print('Starting Windows Subsystem for Android before installation...')
os.system('WsaClient.exe /start') 
os.system('cls')
print('Select the APK file from the popup. After selecting, it will start the install process.')

tk = Tk()
tk.filename = filedialog.askopenfilename(initialdir = "/",title = "Select APK file",filetypes = (("Android App","*.apk"),("all files","*.*")))

filename = str(tk.filename)
app = APK(filename)
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
if selection == "N":
        exec(open("InstallAPK.py").read())

print('Connecting WSA machine through ADB...')
conadb.main()
client = AdbClient(host="127.0.0.1", port=5037)
devices = client.devices()
for device in devices:
    FirstCheck = str(device.is_installed(app.package))
if FirstCheck == "False":
    print("Installing " + app.application + " (" + app.version_name + ")...")
elif FirstCheck == "True":
    print("Updating " + app.application + " to version " + app.version_name + "...")
for device in devices:
    device.install(filename)
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