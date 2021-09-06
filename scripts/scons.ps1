Write-Host "Installing Scons ..." -ForegroundColor Cyan

Write-Host "Downloading..."
$id = [GUID]::NewGuid()
$tempPath = "$env:temp\$id"
New-Item -ItemType directory -Path "$tempPath"
$zipPath = "$tempPath\scons.zip"
(New-Object Net.WebClient).DownloadFile('https://sourceforge.net/projects/scons/files/scons/1.3.1/scons-1.3.1.zip/download', "$zipPath")

Write-Host "Unzip ..."
Expand-Archive -LiteralPath "$zipPath" -DestinationPath "$tempPath"

Write-Host "Installing ..."
cmd /c "C:\Python27\python.exe -m pip install pywin32==224"
cmd /c "C:\Python27\python.exe `"$tempPath\scons-1.3.1\setup.py`" install"

Remove-Item "$tempPath" -Force -Recurse
Write-Host "Installed" -ForegroundColor Green
