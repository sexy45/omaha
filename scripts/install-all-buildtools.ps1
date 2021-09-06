set-executionpolicy remotesigned

& "$PSScriptRoot\visualstudio.ps1"
& "$PSScriptRoot\winsdk.ps1"

Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3" -All

& "$PSScriptRoot\wix.ps1"
& "$PSScriptRoot\python.ps1"
& "$PSScriptRoot\scons.ps1"
& "$PSScriptRoot\go.ps1"
& "$PSScriptRoot\pstools.ps1"

& "$PSScriptRoot\environment.ps1"
