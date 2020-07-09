wsl --shutdown
wsl --export Ubuntu-20.04 D:\Archive\Software\ubuntu2004.tar
Remove-AppxPackage CanonicalGroupLimited.Ubuntu20.04onWindows_2004.2020.424.0_x64__79rhkp1fndgsc
mkdir C:\ubuntu2004
wsl --import ubuntu2004 C:\ubuntu2004 D:\Archive\Software\ubuntu2004.tar
rm D:\Archive\Software\ubuntu2004.tar
