import UAC
import winfeatures
import os

UAC.gainadminaccess()
winfeatures.install('VirtualMachinePlatform')