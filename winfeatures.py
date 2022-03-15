def install(feature):
    packageName = feature
    import os
    os.system("cmd /k dism /online /Enable-Feature /FeatureName:" + packageName + "/All")

if __name__ == "__main__":
    install()