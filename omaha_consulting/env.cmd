set WIX=%programfiles(x86)%\WiX Toolset v3.11
set WindowsSDKVersion=10.0.18362.0\
set WindowsSdkDir=%programfiles(x86)%\Windows Kits\10\
set OMAHA_SIGNTOOL_SDK_DIR=%WindowsSdkDir%\bin\%WindowsSDKVersion%\x64
set WindowsSdkVerBinPath=%WindowsSdkDir%\bin\%WindowsSDKVersion%
set OMAHA_PSEXEC_DIR=%programfiles(x86)%\pstools

set TIMESTAMP_SERVER=http://timestamp.digicert.com
set SHA1_TIMESTAMP_SERVER=http://timestamp.digicert.com
set SHA2_TIMESTAMP_SERVER=http://timestamp.digicert.com

rem Change "Community" to "Professional", etc., if using a non-community version of VS.
call "%programfiles(x86)%\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsamd64_x86.bat"

rem call C:\Python27\python\Scripts\activate.bat
