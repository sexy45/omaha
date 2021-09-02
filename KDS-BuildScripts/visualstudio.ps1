Write-Host "Installing Visual Studio ..." -ForegroundColor Cyan

Write-Host "Downloading..."
$exePath = "$env:temp\vs_professional.exe"
(New-Object Net.WebClient).DownloadFile('https://download.visualstudio.microsoft.com/download/pr/308e891b-f15e-43d8-8cc1-0e41f4962d4b/3d9dcb2b792f2f8e4de13e1e7f0bec7c2d44998c7892509b8044e12dfc63ea39/vs_Professional.exe', $exePath)

Write-Host $exePath

$setupArguments = @(
    "--add" 
    "Microsoft.VisualStudio.Workload.NativeDesktop"
    "--includeRecommended"
    "--quiet"
    "--wait"
)

Write-Host "Installing..."

#cmd /c start /wait $exePath /install + /quiet + /norestart

$process = Start-Process -FilePath $exePath -ArgumentList $setupArguments -Wait -PassThru
Write-Output $process.ExitCode 

Remove-Item $exePath
Write-Host "Installed" -ForegroundColor Green
