Write-Host "Installing Python ..." -ForegroundColor Cyan

Write-Host "Downloading..."
$msiPath = "$env:temp\python-2.7.18.msi"
(New-Object Net.WebClient).DownloadFile('https://www.python.org/ftp/python/2.7.18/python-2.7.18.msi', "$msiPath")

$msiArguments = @(
  "/i"
  "`"$msiPath`""
  "/qn"
  "/norestart"
)

Write-Host "$msiPath"
Write-Host $msiArguments

Write-Host "Installing..."
Start-Process msiexec.exe -Wait -ArgumentList $msiArguments

Remove-Item "$msiPath"
Write-Host "Installed" -ForegroundColor Green
