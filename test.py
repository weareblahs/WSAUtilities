import admin_popup
import winfeatures
if admin_popup.run_as_admin() == True:
     winfeatures.install('VirtualMachinePlatform0')
     input('Press ENTER to exit.')
elif admin_popup.run_as_admin() == None:
     print ('Installation will be opened in another window. Please wait.')
     input('Press ENTER to exit.')
else:
     print ('Error(ret=%d): cannot elevate privilege.') % (ret, )