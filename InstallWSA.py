import UAC as runasadmin
import os
from urllib.request import Request, urlopen
import requests
from requests.structures import CaseInsensitiveDict
from bs4 import BeautifulSoup, SoupStrainer
import urllib.request
import pathlib
from clint.textui import progress
from hurry.filesize import size
import subprocess
import sys
import ctypes
import winfeatures

def run_as_admin(argv=None, debug=False):
    shell32 = ctypes.windll.shell32
    if argv is None and shell32.IsUserAnAdmin():
        return True
        
    if argv is None:
        argv = sys.argv
    if hasattr(sys, '_MEIPASS'):
        arguments = map(str, argv[1:])
    else:
        arguments = map(str, argv)
    argument_line = u' '.join(arguments)
    executable = str(sys.executable)
    if debug:
        print ('Command line: '), executable, argument_line
    ret = shell32.ShellExecuteW(None, u"runas", executable, argument_line, None, 1)
    if int(ret) <= 32:
        return False
    return None

if __name__ == '__main__':
    ret = run_as_admin()

if ret is True:
        print('InstallWSA is running with elevated permissions.')
elif ret is None:
        print ('InstallWSA will be launching on a new window with administrator rights.')
        input('Press ENTER to exit this window.')
        exit()

def searchforlink():
    print('Searching for latest Windows Subsystem for Android package from store.rg-adguard.net...')

searchforlink()
cwd = os.getcwd()
url = "https://store.rg-adguard.net/api/GetFiles"
headers = CaseInsensitiveDict()
headers["Content-Type"] = "application/x-www-form-urlencoded"
data = "type=url&url=https%3A%2F%2Fwww.microsoft.com%2Fstore%2FproductId%2F9P3395VX91NR"
stat = requests.post(url, headers=headers, data=data)
if str(stat.status_code) == "200":
       print('Successful! Saving URLs into temp folder...')
       writetofile = open('temp/wsaresult.html', "w")
       writetofile.write(str(stat.content))
       writetofile.close()
p = pathlib.PureWindowsPath(cwd + "/temp/wsaresult.html").as_uri()
html_page = urllib.request.urlopen(p)
soup = BeautifulSoup(html_page, "html.parser")
for link in soup.findAll('a'):
    links = link.get('href')
    writetofile = open('temp/link', "w")
    writetofile.write(str(links))
    writetofile.close()
    with open('temp/link', 'r') as file:
        wsalink = file.read()

r = requests.get(wsalink, stream=True)
wsaoutpath = "temp/wsa.msixbundle"

if os.path.exists(wsaoutpath):
    print("It looks like you've downloaded it before. Going to install process...")
else:
    file = urllib.request.urlopen(wsalink)
    filesize = file.length
    print("Filesize for Windows Subsystem for Android installation package is " + size(filesize) + ".")
    print('Starting download...')
    with open(wsaoutpath, 'wb') as f:
        total_length = int(r.headers.get('content-length'))
        for chunk in progress.bar(r.iter_content(chunk_size=1024), expected_size=(total_length/1024) + 1): 
            if chunk:
                f.write(chunk)
                f.flush()
    print("Download complete!")
print("Installing...")
os.system('powershell Add-AppxPackage -Path temp\WSA.msixbundle')
print('Enabling Virtual Machine Platform. This is required to use Windows Subsystem for Android.')
winfeatures.install('VirtualMachinePlatform')
os.system('cls')
print('Installation complete!')
print('Windows Subsystem for Android requires a restart of your computer in order to make it working.')
print('Do you want to restart?')
print('Y: Yes')
print('N: No')
selection = input("Please choose your selection and press ENTER: ")
if selection == "Y":
    os.system('shutdown /r /t 0 /d WSAUtilities Restart')
elif selection == "y":
    os.system('shutdown /r /t 0 /d WSAUtilities Restart')
else:
    exit()