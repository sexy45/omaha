# **KDS Update: Building Instructions**

These instructions complement the original developer notes.  They are targeted at creating a stand alone build machine.  The primary assumption is that one is starting with a basic Windows installation with no other software installed.  

The scripts associated with these instructions will download the necessary packages from the internet and install them.

[Developer Setup Guilde](..\doc\DeveloperSetupGuide.md)  
[Omaha Consulting Setup Guilde](..\omaha_consulting\DeveloperSetupGuide.md)


## **Required build tools:**
- Visual Studio 2019
- Scons 1.3.1
- Wix 3.11
- Windows SDK 1903
- .Net 3.5
- Python 2.7
- Go
- PSTools

### **Other pre-requisites:**
- Git
- SSH

### **Powershell Execution**
*Powershell scripts are provided to facilitate the following instructions.*

Run powershell with administrative privileges.  
Set powershell execution policy so it can run scripts.  
```
set-executionpolicy remotesigned
```

### **Git**
Need to install git to download the scripts, or directly access them from GitLab.

Script: [git-install.ps1](.\BuildScripts\git-install.ps1)   
Gitlab Url: [https://gitlab.com/Distributed-Compute-Protocol/eliot/kds-update/-/blob/development/KDS-BuildScripts/git-install.ps1](https://gitlab.com/Distributed-Compute-Protocol/eliot/kds-update/-/blob/development/KDS-BuildScripts/git-install.ps1)  
Source Url: [https://github.com/tomlarse/Install-Git](https://github.com/tomlarse/Install-Git)  
Destination: c:\Program Files\Git  

### **Close Source Repository**

*Important: Need ssh key that has been registered with gitlab.*

Use &quot;ssh-keygen&quot; command and register the resulting public key (c:\Users\\&lt;username\&gt;\.ssh\id\_rsa.pub) with gitlab server.
```
ssh-keygen
```
Repository: [git@gitlab.com:Distributed-Compute-Protocol/eliot/kds-update.git](git@gitlab.com:Distributed-Compute-Protocol/eliot/kds-update.git)  
Branch: development  
Destination: c:\kds-update
```
cd c:\
git clone --branch development git@gitlab.com:Distributed-Compute-Protocol/eliot/kds-update.git
```

### **Visual Studio 2019**

*Important: Need to use version 16.9.1.*

Version 16.10.1 does not work (July/2021).  
Only need to install native desktop workload, with all recommenced components (Microsoft.VisualStudio.Workload.NativeDesktop).

Comes as a 90 free trail with no license key. The command line setup can be adjusted to accommodate a license key.

Script: [visualstudio.ps1](.\BuildScripts\visualstudio.ps1)  
Download Url: [https://download.visualstudio.microsoft.com/download/pr/308e891b-f15e-43d8-8cc1-0e41f4962d4b/3d9dcb2b792f2f8e4de13e1e7f0bec7c2d44998c7892509b8044e12dfc63ea39/vs\_Professional.exe](https://download.visualstudio.microsoft.com/download/pr/308e891b-f15e-43d8-8cc1-0e41f4962d4b/3d9dcb2b792f2f8e4de13e1e7f0bec7c2d44998c7892509b8044e12dfc63ea39/vs_Professional.exe)  
Release History: [https://docs.microsoft.com/en-us/visualstudio/releases/2019/history#release-dates-and-build-numbers](https://docs.microsoft.com/en-us/visualstudio/releases/2019/history%23release-dates-and-build-numbers)

### **Windows SDK 1903**

There may be issues with the SDK provided by Visual Studio, so it is necessary to install separately.

Script: [winskd.ps1](.\BuildScripts\winskd.ps1)  
Download Url: [https://go.microsoft.com/fwlink/?linkid=2083338](https://go.microsoft.com/fwlink/?linkid=2083338)

### **.Net 3.5**

.Net 3.5 is required by Wix.

No script, just execute following powershell command.
```
Enable-WindowsOptionalFeature -Online -FeatureName &quot;NetFx3&quot; -All
```

### **Wix 3.11**
Script: [wix.ps1](.\BuildScripts\wix.ps1)   
Destination: c:\Program Files (x86)\WiX Toolset v3.11  
Download Url: [https://github.com/wixtoolset/wix3/releases/download/wix3112rtm/wix311.exe](https://github.com/wixtoolset/wix3/releases/download/wix3112rtm/wix311.exe)

### **Python 2.7**
Python is required for the main build tool: &quot;scons&quot;.  
Needs to be added to front of environment path.

Script: [python.ps1](.\BuildScripts\python.ps1)   
Destination: c:\Python27.  
Download Url: [https://www.python.org/ftp/python/2.7.18/python-2.7.18.msi](https://www.python.org/ftp/python/2.7.18/python-2.7.18.msi)

### **Scons 1.3.1**
Install pywin32 first.

Script: [scons.ps1](.\BuildScripts\scons.ps1)   
Destination: c:\scons-1.3.1  
Download Url: [https://sourceforge.net/projects/scons/files/scons/1.3.1/scons-1.3.1.zip/download](https://sourceforge.net/projects/scons/files/scons/1.3.1/scons-1.3.1.zip/download)

### **Go (1.14.6)**
Script [go.ps1](.\BuildScripts\go.ps1)   
Destination: c:\go  
Download Url: [https://storage.googleapis.com/golang/go1.14.6.windows-amd64.msi](https://storage.googleapis.com/golang/go1.14.6.windows-amd64.msi)

### **PSTools**
Script [pstools.ps1](.\BuildScripts\pstools.ps1)  
Destination: c:\ptools  
Download Url: [https://download.sysinternals.com/files/PSTools.zip](https://download.sysinternals.com/files/PSTools.zip)

### **System Environment Path and Variables**
The system path has to be augmented to include python, and an Omaha specific environment variable for the python directory needs to be made pervasive.

Script: [environment.ps1](.\BuildScripts\environment.ps1)

### **Source Symbolic Links**
Add symbolic links to the repository linking the third-party libraries with the correct location in the Omaha directory structure.

Script: [build-links.ps1](.\BuildScripts\build-links.ps1) 

### **Single Install All Script**
A single script to install all the build tools. Will also add the symbolic links to the source code.  
Assumes the source repository has already been pulled.

Script: [install-all-buildtools.ps1](.\BuildScripts\install-all-buildtools.ps1) 

### **Building the Omaha Update Project**
- Use command window.
- Apply Omaha environment variables.
- Build with &quot;hammer&quot;.
- [Hammer Options](..\doc\HammerOptions.md)

```
cd c:\kds-update\omaha
omaha_consulting\env.cmd
cd omaha
hammer --all
```


