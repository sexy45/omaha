Write-Host "Build Links ..." -ForegroundColor Cyan

$originalLocation = Get-Location

Set-Location "$PSScriptRoot\..\omaha_consulting"

cmd /c "mklink /D ..\third_party\breakpad `"%CD%\breakpad-master-2021-05-28`""
cmd /c "mklink /D ..\third_party\googletest `"%CD%\googletest-master-2021-05-28`""
cmd /c "mklink /D ..\third_party\libzip `"%CD%\libzip-1.7.3`""
cmd /c "mklink /D ..\third_party\zlib `"%CD%\zlib-1.2.11`""

Set-Location "$originalLocation"

Write-Host "Links built." -ForegroundColor Green
