---
layout: post
title: "Enable Windows Subsystem for Linux on Windows"
date: 2019-04-07
categories: blog development windows linux
tags: Linux Windows WSL
---

## Install a Linux distribution

The `wsl --install` command requires Windows 11 or Windows 10 version 2004 (build 19041) or later. On an older build, check Microsoft's [manual WSL installation guide](https://learn.microsoft.com/en-us/windows/wsl/install-manual) for the minimum requirements and steps.

For a fresh installation, open PowerShell as an administrator and run:

```powershell
wsl --install
```

Restart Windows when the installation finishes. The command enables the required Windows features and installs Ubuntu as the default distribution. If WSL is already installed or you want a different distribution, use the commands under [Install another Linux distribution and set a new default](#install-another-linux-distribution-and-set-a-new-default). See Microsoft's [WSL installation guide](https://learn.microsoft.com/en-us/windows/wsl/install) for installation options and troubleshooting.

### Set up your account

Open Ubuntu from the Start menu if it does not open automatically. On first launch, create a Linux username and password. This account is specific to the distribution and is separate from your Windows account. Use the Linux password when `sudo` prompts you.

### Update your distribution

In the Ubuntu shell, refresh the package lists and review the available upgrades before confirming:

```bash
sudo apt update && sudo apt upgrade
```

## Use Linux commands and work across Windows and Linux file systems

Run `wsl` in PowerShell or Command Prompt to open the default Linux distribution. Run `wsl ~` to start in your Linux home directory. Inside the Linux shell, the Windows `C:` drive is normally available at `/mnt/c`.

## Change the default terminal shell to WSL

In VS Code, run **Terminal: Select Default Profile** from the Command Palette. Select your Linux distribution, then open a new terminal. See the [VS Code terminal profiles documentation](https://code.visualstudio.com/docs/terminal/profiles#wsl) if the distribution is missing from the list.

## WSL Config

Use `wsl` from PowerShell or Command Prompt to manage distributions. Run `wsl --list --verbose` to see installed distributions, their running state, and whether each uses WSL 1 or WSL 2. Run `wsl --help` or see Microsoft's [WSL command reference](https://learn.microsoft.com/en-us/windows/wsl/basic-commands) for more options.

## Install another Linux distribution and set a new default

From PowerShell, list available distributions and install Debian as an example. Use the exact name shown in the online list:

```powershell
wsl --list --online
wsl --install -d Debian
```

Complete Debian's first-launch setup and return to PowerShell. Set Debian as the default, then check that it is marked with an asterisk in the list:

```powershell
wsl --set-default Debian
wsl --list --verbose
```

Run `wsl` to launch the default distribution, or use `wsl --distribution Ubuntu` to launch Ubuntu explicitly if it is installed.

{: .box-warning}
**Warning:** `wsl --unregister Debian` permanently deletes that distribution's files, settings, and installed software. Back up the distribution before unregistering it.

Related article: [WSL - Upgrade Ubuntu to the latest release](https://danielschwensen.github.io/2021-04-11-WSL_Upgrade_Ubuntu_to_the_latest_release/)
