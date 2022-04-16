import os

# for back to diag menu
prevdir = os.path.abspath(os.path.join(os.path.dirname( __name__ ), '..'))

print("Windows Subsystem for Android backend controls")
print('')
print(
    '''
    [1]: Start Windows Subsystem for Android client VM
    [2]: Stop Windows Subsystem for Android client VM
    [3]: Restart Windows Subsystem for Android client VM

    [Q]: Back to diagnostics menu
    '''
)
print('')
selection = input("Please choose your selection and press ENTER: ")

if selection=="1":
    print("Starting Windows Subsystem for Android...")
    print("If you're stuck here, your WSA is probably started. You can use Ctrl+C or close this window to exit now.")
    os.system("WsaClient.exe /start")
    print("Task complete! Returning to menu...")
    os.system("cls")
    exec(open("WSABackends.py").read())
elif selection=="2":
    print("Stopping Windows Subsystem for Android...")
    print("If you're stuck here, your WSA is probably stopped. You can use Ctrl+C or close this window to exit now.")
    os.system("WsaClient.exe /stop")
    print("Task complete! Returning to menu...")
    os.system("cls")
    exec(open("WSABackends.py").read())
elif selection=="3":
    print("Restarting Windows Subsystem for Android...")
    print("If you're stuck here, your WSA is probably restarted. You can use Ctrl+C or close this window to exit now.")
    os.system("WsaClient.exe /restart")
    print("Task complete! Returning to menu...")
    os.system("cls")
    exec(open("WSABackends.py").read())
elif selection=="Q":
    os.chdir(prevdir)
    exec(open("Diagnostics.py").read())
elif selection=="q":
    os.chdir(prevdir)
    exec(open("Diagnostics.py").read())