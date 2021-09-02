Write-Host "Installing Scons ..." -ForegroundColor Cyan

Write-Host "Downloading..."
$zipPath = "$env:temp\scons.zip"
(New-Object Net.WebClient).DownloadFile('https://sourceforge.net/projects/scons/files/scons/1.3.1/scons-1.3.1.zip/download', $zipPath)

Write-Host "Unzip ..."
Expand-Archive -LiteralPath $zipPath -DestinationPath C:\

Write-Host "Installing ..."
cmd /c "C:\Python27\python.exe -m pip install pywin32==224"
cmd /c "C:\Python27\python.exe C:\scons-1.3.1\setup.py install"

Remove-Item $zipPath
Write-Host "Installed" -ForegroundColor Green
