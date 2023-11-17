import subprocess
import sys

packageList = ['django', 'flask']

def install(package):
    subprocess.check_call([sys.executable, "-m", "pip", "install", package])

try:
    for i in packageList:
        install(i)
except:
    print("\n\n\n\n\nFailed to install package automatically! Please download the package manually... F, RIP lol.\n\n\n\n\n")

else:
    print("\n\n\n\n\nInstalled package successfully! Yayy! No F today!\n\n\n\n\n")
