:: Installs Aurora Store from F-Droid
wget https://f-droid.org/repo/com.aurora.store_38.apk
adb connect 127.0.0.1:58526
adb install com.aurora.store_38.apk
echo Installation Complete!
echo Press any key to go back to the WSAtools Menu.
pause >nul
WSATools
