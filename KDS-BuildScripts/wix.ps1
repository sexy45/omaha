Write-Host "Installing Wix ..." -ForegroundColor Cyan

Write-Host "Downloading..."
$exePath = "$env:temp\wix311.exe"
(New-Object Net.WebClient).DownloadFile('https://github.com/wixtoolset/wix3/releases/download/wix3112rtm/wix311.exe', $exePath)

Write-Host "Installing..."
cmd /c start /wait $exePath /install + /quiet + /norestart

Remove-Item $exePath
Write-Host "Installed" -ForegroundColor Green