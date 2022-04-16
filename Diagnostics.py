import configparser
import os


config = configparser.ConfigParser()
config.read('WSAU.ini')
name = config['VersionInfo']['ProductName']

print(f'{name} diagnostics menu')
print('')
print(
    '''
    [1]: Windows Subsystem for Android backend controls
    [2]: App Management

    [3]: Back to WSAUtilities
    '''
)
print('')
selection = input("Please choose your selection and press ENTER: ")

if selection=="1":
    os.chdir("diag")
    exec(open("WSABackends.py").read())
elif selection=="2":
#    os.chdir("diag")
#    exec(open("AppMgmt.py").read())
    print("Feature coming soon.")
elif selection=="3":
    exec(open("CliLauncher.py").read())