#
#  add python to path
#  and set omaha python dir environment variable
#  scope of both is machine.
#
$pythonPath = "C:\Python27"

[System.Environment]::SetEnvironmentVariable('OMAHA_PYTHON_DIR', $pythonPath, [System.EnvironmentVariableTarget]::Machine)

$oldPath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path).path
$newPath = "$pythonPath;$oldPath"  
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path -Value $newPath
