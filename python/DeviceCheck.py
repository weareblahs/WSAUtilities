import platform
import configparser

config = configparser.ConfigParser()
config.read('WSAU.ini')
currentBuild0 = config['DeviceCheck']['Current']
currentBuild = "10.0." + currentBuild0
userVersion = platform.version()


if currentBuild == userVersion:
    print("Build is " + currentBuild)

if currentBuild > userVersion:
    print(")

else
    print("Device not supported for Windows Subsystem for Android. Make sure you installed a stable version of Windows 11 or Windows 11 Insider Builds.")