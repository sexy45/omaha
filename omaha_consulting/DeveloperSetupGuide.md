# Developer Setup Guide (Omaha Consulting Edition)

To set up a development environment. follow the original
[Developer Setup Guide](../doc/DeveloperSetupGuide.md)
and the steps below. They were tested with revision 0d9965c.

 1. Install Visual Studio 2019. Do install the component "Desktop development
    with C++". But de-select the Windows 10 SDK (it isn't the right version).
    The installer will likely say that it then needs to de-select some other
    components as well. Accept this. Also make sure that the component
    `C++ ATL for latest v142 build tools (x86 & x64)` will be installed.

 2. Install the Windows 10 SDK, version 1903 (10.0.18362.1) from
    https://developer.microsoft.com/en-us/windows/downloads/sdk-archive/.

 3. Install `wix311.exe`. Enable the Windows feature ".NET Framework 3.5" in
    case WIX tells you to.

 4. Install 32 bit Python 2.7 into `C:\Python27`.

 5. Download and extract
    [`scons-1.3.1.zip`](https://sourceforge.net/projects/scons/files/scons/1.3.1/scons-1.3.1.zip/download).

 6. Install `virtualenv`. To do this, write the following into an Administrator
    command prompt: `C:\Python27\python -m pip install virtualenv`

 7. Open a command prompt in the `omaha_consulting/` subdirectory of Omaha's source
    tree. Type the following commands:

    `C:\Python27\python -m virtualenv python`
    `call python\Scripts\activate.bat`
    `pip install pywin32==224`
    `python ...\path\to\scons-1.3.1\setup.py install`
    `mklink /D ..\third_party\breakpad %CD%\breakpad-master-2021-05-28`
    `mklink /D ..\third_party\googletest %CD%\googletest-master-2021-05-28`
    `mklink /D ..\third_party\libzip %CD%\libzip-1.7.3`
    `mklink /D ..\third_party\zlib %CD%\zlib-1.2.11`

 8. Install Go 1.14.6 into `C:\Go-1.14.6-amd64`.

 9. Extract `PSTools.zip` into `C:\Program Files (x86)`, so you have
    `C:\Program Files (x86)\pstools\psexec.exe`.

 10. Update environment variables in [`env.cmd`](env.cmd), if necessary.

## Building

After the above steps, open an Administrator Command Prompt (don't forget the
environment variables), `cd` into Omaha's source tree and type:


    call omaha_consulting\env.cmd
    cd omaha
    hammer -j32 --all --mode=all

(Adjust the number `32` to the number of cores on your system.)
You will see some `scons` warnings at the beginning. That's okay.

## Running tests

Create the registry key
`HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\<CompanyName>\UpdateDev`
with the string value `TestSource` set to `ossdev`. Then run the following as
Administrator:

    scons-out\dbg-win\staging\omaha_unittest.exe --gtest_brief=1

The following 8 tests will likely fail:

 * `TimeTest.RFC822TimeParsing`
 * `UserInfoTest.GetProcessUserSid`
 * `VistaUtilTest.IsUACOn`
 * `VistaUtilTest.IsElevatedWithUACOn`
 * `OmahaCustomizationTest.IsInternalUser`
 * `SchedulerTest.UsesDebugTimer`
 * `WorkerWithTwoAppsTest.CheckForUpdateAsync_Large`
 * `WorkerWithTwoAppsTest.DownloadAsyncThenDownloadAndInstallAsync_Large5`

That's normal.