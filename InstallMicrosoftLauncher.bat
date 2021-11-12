:: Downloads and installs Microsoft Launcher from APKPure
wget -O mslauncher.apk "https://download.apkpure.com/b/APK/Y29tLm1pY3Jvc29mdC5sYXVuY2hlcl8xMDExMDIwXzUxYzI3ZDM5?_fn=TWljcm9zb2Z0IExhdW5jaGVyX3Y2LjIxMTAwMi4wLjEwMTEwMjBfYXBrcHVyZS5jb20uYXBr&as=da3f53c3bce85042bd8f23ca23d073af618d20b6&ai=1891878819&at=1636638782&_sa=ai%2Cat&k=8b78a5b444d90c6434eec8f8bd29a35d618fc33e&_p=Y29tLm1pY3Jvc29mdC5sYXVuY2hlcg&c=1%7CPERSONALIZATION%7CZGV2PU1pY3Jvc29mdCUyMENvcnBvcmF0aW9uJnQ9YXBrJnM9MjY4OTgxMzEmdm49Ni4yMTEwMDIuMC4xMDExMDIwJnZjPTEwMTEwMjA"
adb connect 127.0.0.1:58526
adb install mslauncher.apk
echo Installation Complete!
echo Press any key to go back to the WSAtools Menu.
pause >nul
WSATools
