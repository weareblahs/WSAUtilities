def install(feature):
    packageName = feature
    featurecommand = "dism /online /Enable-Feature /FeatureName:" + packageName + " /All"
    import os
    os.system(featurecommand)
    return featurecommand

if __name__ == "__main__":
    install()