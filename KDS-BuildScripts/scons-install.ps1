Write-Host "Installing Scons 1.3.1 ..." -ForegroundColor Cyan

Write-Host "Installing virtualenv ..."
cmd /c "C:\Python27\python.exe -m pip install virtualenv"

Write-Host "Installing pywin32 ..."
cmd /c "c:\Python27\python.exe -m pip install pywin32==224 "


Write-Host "Installing scons ..."
cmd /c "c:\Python27\python.exe c:\scons-1.3.1\setup.py install" 

#Remove-Item $exePath
Write-Host "Installed" -ForegroundColor Green
