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
subprocess.call("powershell Add-AppxPackage -Path temp\wsa_installation.msixbundle")