# Developer Setup Guide (Omaha Consulting Edition)

To set up a development environment. follow the original
[Developer Setup Guide](../doc/DeveloperSetupGuide.ma)
and the steps below. They were tested with revision a1e8a0d8.

 1. Install Visual Studio 2017 Community Edition version 15.9.
    Do install the component "Desktop development with C++".
    But de-select the Windows 10 SDK (it isn't the right version).
    The installer will likely say that it then needs to de-select
    some other components as well. Accept this.

 2. Install the Windows 10 SDK, version 1903 (10.0.18362.1) from
    https://developer.microsoft.com/en-us/windows/downloads/sdk-archive/.

 3. Download the Windows Template Library (WTL) 10.1077. Extract its files so
    you have `C:\wtl\files\Include`.

 4. Install `wix311.exe`. Enable the Windows feature ".NET Framework 3.5" in
    case WIX tells you to.

 5. Install 32 bit Python 2.7 into `C:\Python27`.

 6. Install the pywin32 extensions: `C:\Python27\python -m pip install pywin32`.

 7. Install scons-1.3.1.win32.exe into `C:\Python27\Lib\site-packages`.

 8. Extract `swtoolkit.0.9.1.zip` so you have `C:\swtoolkit\`.

 9. Install Go 1.14.6 into `C:\Go`.

10. Extract `protoc-3.9.2-win32.zip` so you have `C:\protobuf\bin`.

11. Extract `protobuf-cpp-3.9.2.zip\protobuf-3.9.2\src` so you have
    `C:\protobuf\src`.

12. Extract `breakpad-master.zip\breakpad-master` so you have eg.
    `omaha\third_party\breakpad\android`, `...\autotools`, ...

13. Similarly for `googletest-master.zip`.

14. Extract `libzip-1.5.2.tar.xz` so you have `examples\`, `lib\`, ... inside
    `omaha\third_party\libzip`.

15. Extract `zlip-1.2.11.tar.gz\zlib-1.2.11` so you have the files `amiga/`,
    `contrib/`, ... inside `omaha\third_party\zlib\v1_2_11\`.

16. Extract `PSTool.zip` into `C:\Program Files (x86)`, so you have
    `C:\Program Files (x86)\pstools\psexec.exe`.

17. Add `C:\Python27` to your `PATH` environment variable.

18. Set the other environment variables in [`env.cmd`](env.cmd).