Write-Host "Installing PSTools ..." -ForegroundColor Cyan

Write-Host "Downloading..."
$zipPath = "$env:temp\pstools.zip"
(New-Object Net.WebClient).DownloadFile('https://download.sysinternals.com/files/PSTools.zip', "$zipPath")

Write-Host "Unzip ..."
Remove-Item "${env:ProgramFiles(x86)}\pstools" -ErrorAction Ignore -Force -Recurse
Expand-Archive -LiteralPath "$zipPath" -DestinationPath "${env:ProgramFiles(x86)}\pstools"

Remove-Item "$zipPath"
Write-Host "Installed" -ForegroundColor Green
