import UAC
import os
import sys
import win32com.shell.shell as shell
ASADMIN = 'asadmin'

isAdmin = sys.argv[-1] == ASADMIN

if not isAdmin:
    script = os.path.abspath(sys.argv[0])
    params = ' '.join([script] + sys.argv[1:] + [ASADMIN])
    shell.ShellExecuteEx(lpVerb='runas', lpFile=sys.executable, lpParameters=dism)
print(isAdmin)

