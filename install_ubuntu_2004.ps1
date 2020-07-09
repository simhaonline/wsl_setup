Add-AppxPackage D:\Archive\Software\Ubuntu2004.appx
ubuntu2004.exe
wsl exec env PWD='/mnt/d/Projects/wsl_setup' ./wsl_setup.sh
wsl --shutdown
wsl --export Ubuntu-20.04 $env:TEMP\ubuntu2004.tar
Remove-AppxPackage CanonicalGroupLimited.Ubuntu20.04onWindows_2004.2020.424.0_x64__79rhkp1fndgsc
mkdir C:\ubuntu2004
wsl --import ubuntu2004 C:\ubuntu2004 $env:TEMP\ubuntu2004.tar
rm $env:TEMP\ubuntu2004.tar