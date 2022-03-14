def main():
    import adbutils
    adb = adbutils.AdbClient(host="127.0.0.1", port=5037)
    output = adb.connect("127.0.0.1:58526")
    d = adb.devices()
    adb.wait_for("127.0.0.1:58526", state="device")
    connectionstat = str(output)
    if connectionstat == "already connected to 127.0.0.1:58526":
        print('Already connected to Windows Subsystem for Android')
    elif connectionstat == "Connected to 127.0.0.1:58526":
        print('Successfully connected to Windows Subsystem for Android')
    else:
        print ('Failed to connect to Windows Subsystem for Android. Current process will be stopped.')
        exit()
if __name__ == "__main__":
    main()