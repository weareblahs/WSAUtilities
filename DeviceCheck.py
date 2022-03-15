import platform
import configparser
import time

config = configparser.ConfigParser()
configL = configparser.RawConfigParser()
write_config = configparser.ConfigParser()
config.read('WSAU.ini')
currentBuild0 = config['DeviceCheck']['Current']
currentBuild = "10.0." + currentBuild0
userVersion = platform.version()


if currentBuild == userVersion:
    print("You are running a stable build of Windows 11, that means you can run Windows Subsystem for Android.")
    write_config.add_section("System")
    write_config.set("System","supported","true")
    cfgfile = open("WSAU_user.ini",'w')
    write_config.write(cfgfile)
    print("Redirecting to launcher in 5 seconds...")
    time.sleep(5)
    exec(open("CliLauncher.py").read())

elif currentBuild > userVersion:
    print("You are running an insider build of Windows 11, that means your computer can run Windows Subsystem for Android and it can also be downloaded on Windows Store without using InstallWSA.")
    write_config.add_section("System")
    write_config.set("System","supported","true")
    cfgfile = open("WSAU_user.ini",'w')
    write_config.write(cfgfile)
    print("Redirecting to launcher in 5 seconds...")
    time.sleep(5)
    exec(open("CliLauncher.py").read())

else:
    print("Device not supported for Windows Subsystem for Android. Make sure you installed a stable version of Windows 11 or Windows 11 Insider Builds.")
    print("Exiting in 5 seconds...")
    time.sleep(5)
    exit()