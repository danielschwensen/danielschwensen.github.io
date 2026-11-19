---
layout: post
title: "Back Up and Restore a WSL Distribution"
categories: OS
tags: Linux WSL Windows Ubuntu
---

Before upgrading Ubuntu in WSL or moving to another Windows PC, export your distribution to a tar archive. You can then import that archive under a new name and check that your files and tools are available. This example uses Ubuntu on WSL 2 and runs all Windows commands in PowerShell.

### **Find the Distribution and User**

```powershell
wsl --list --verbose
```

Copy the exact name from the `NAME` column. For this example, the `VERSION` column should show `2`.

```powershell
$Distro = 'Ubuntu-24.04'
wsl --distribution $Distro -- id -un
```

Keep the Linux username printed by the second command. You will use it to check the restore and set the default user if necessary.

### **Export the Distribution**

Save your work and stop any services writing data inside Ubuntu. Terminating the distribution closes its Linux processes.

```powershell
$BackupDir = Join-Path $env:USERPROFILE 'wsl-backups'
New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
$Stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$BackupFile = Join-Path $BackupDir "$Distro-$Stamp.tar"

wsl --terminate $Distro
if ($LASTEXITCODE -ne 0) { throw 'Could not stop the distribution.' }

wsl --export $Distro $BackupFile
if ($LASTEXITCODE -ne 0) { throw 'The WSL export failed.' }

Get-Item -LiteralPath $BackupFile | Select-Object FullName, Length
```

The archive contains the distribution's Linux filesystem, including its Linux home directories and installed packages. Back up Windows files accessed through mounts such as `/mnt/c` separately. Keep a copy of the archive outside the PC you are backing up.

### **Restore Under a New Name**

Choose a distribution name absent from `wsl --list --verbose` and give it a dedicated directory. For a move to another PC, install WSL there first, copy the tar archive and set `$BackupFile` to its location on that PC.

```powershell
$RestoreName = 'Ubuntu-Restore-Test'
$RestoreDir = Join-Path $env:LOCALAPPDATA "WSL\$RestoreName"
if (Test-Path -LiteralPath $RestoreDir) {
    throw 'Choose a new name and an unused restore directory.'
}
New-Item -ItemType Directory -Path $RestoreDir -Force | Out-Null

wsl --import $RestoreName $RestoreDir $BackupFile --version 2
if ($LASTEXITCODE -ne 0) { throw 'The WSL import failed.' }

wsl --list --verbose
```

On the original PC, both names should now appear in the list. Check the restored system and use the username you recorded earlier.

```powershell
$LinuxUser = 'alice' # Replace with your Linux username
wsl --distribution $RestoreName -- cat /etc/os-release
wsl --distribution $RestoreName --user $LinuxUser -- id -un
wsl --distribution $RestoreName --user $LinuxUser -- ls -la "/home/$LinuxUser"
```

The last command assumes a standard Ubuntu home directory. Open a project you recognize and run one tool you use regularly. A successful import confirms that WSL could read the archive. Opening a project checks that it contains the data you need.

### **Set the Default User if the Restore Opens as Root**

Check the user with `wsl --distribution $RestoreName -- id -un`. If it prints `root` and you want the restored copy to open as your regular user, start a root shell in the restored copy.

```powershell
wsl --distribution $RestoreName --user root
```

Edit `/etc/wsl.conf` inside that shell. Add the following section or update `default` in the existing `[user]` section. Substitute your Linux username.

```ini
[user]
default=alice
```

Exit the Linux shell and restart the restored distribution from PowerShell.

```powershell
wsl --terminate $RestoreName
wsl --distribution $RestoreName -- id -un
```

The final command should print your Linux username.

### **More Information**

- [Enable Windows Subsystem for Linux on Windows]({% link _posts/2019-04-07-Enable Windows Subsystem for Linux on Windows.md %})
- [WSL basic commands](https://learn.microsoft.com/en-us/windows/wsl/basic-commands)
- [Set the default user for an imported distribution](https://learn.microsoft.com/en-us/windows/wsl/use-custom-distro#add-wsl-specific-components-like-a-default-user)
