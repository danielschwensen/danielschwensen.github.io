---
layout: post
title: "Enable Windows Subsystem for Linux on Windows"
date: 2019-04-07
categories: blog development windows linux
tags: Linux Windows WSL
---

The Windows Subsystem for Linux lets developers run a Linux environment - including most command-line tools, utilities, and applications - directly on Windows, unmodified, without the overhead of a virtual machine.

1. To enable Windows Subsystem for Linux (WSL) on your computer, you need to run the following powershell command as an admin:


````powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
````


2. Restart your computer when prompted

## Install a Linux distribution

There are several Linux distributions available to run on WSL. You can find and install your favorite in the Microsoft Store.

**[Ubuntu](https://www.microsoft.com/store/p/ubuntu/9nblggh4msv6)**


### Set up your account

After the Linux distribution has installed, open it. You can do this by entering WSL from the Start menu. You'll be prompted to create an account name and password when you run a distribution for the first time. After this first time, when you start the distribution, you'll be signed in as this normal (non-admin) user by default.

{: .box-note}
**Note:** You can choose any user name and password. They have no bearing on your Windows user name. After you create the user account, you won't be prompted for your password when using the distribution, unless you elevate a process by using the sudo command. Sudo stands for "SuperUser Do" and is used for any task requiring root admin privilege, like installing tools or frameworks.

### Update your distribution


````bash
sudo apt update && sudo apt upgrade -y
````


## Use Linux commands and work across Windows and Linux file systems

You can also run your Linux distribution path right inside the Windows command prompt (or in PowerShell), by entering wsl.exe or bash.exe. These commands will switch to a display of the Linux command line, using the path for your current directory. This path will appear to be in a mounted folder, /mnt/c, because we're now viewing your Windows C:\ drive folder from the Linux subsystem. You can access all of your local computer's file system from within the Linux shell by using this /mnt/c mounted file path.

## Change the default terminal shell to WSL

In VS Code, select View > Terminal (or select Ctrl+`, using the backtick character). A command-line (or terminal shell) window will open at the bottom of your VS Code window. This window lets you run Node.js and other command-line tools without leaving VS Code. The default terminal is PowerShell.

To change the default VS Code terminal shell, select Customize. A settings window with a list of options will open. Select WSL Bash in the list. (If the Customize button doesn't appear, select the F1 key and enter Terminal: Select Default Shell.)

## WSL Config

WSL Config (wslconfig.exe) is a command-line tool for managing Linux distributions running on WSL. You can use it to list available distributions, set a default distribution, and uninstall distributions. To see the available options for WSL Config, enter wslconfig.exe /? in your Windows command prompt or in PowerShell.

## Install another Linux distribution and set a new default

1. To see a list of the Linux distributions you currently have installed, open PowerShell and enter wslconfig.exe /list. You will probably only see Ubuntu (default).
2. Let's install another distribution from Microsoft Store. To install the distribution, go to Debian GNU/Linux. Select the Get button, wait for the distribution to install, and then select Launch.
3. After the new distribution starts, it will prompt you to choose a new UNIX user name and password. After you do so, open PowerShell again and enter wslconfig.exe /list. You should now see your multiple Linux distributions represented, including an indicator that your Ubuntu distribution is still set to be the default for use with commands in PowerShell, like wsl.exe.
4. Set the new Debian distribution to be the default when running WSL on the command line (or in PowerShell) by using wslconfig.exe /setdefault Debian. Run wslconfig /list again and make sure that Debian is now marked as the default.
Now if you're using PowerShell and enter wsl, you'll open a Debian distribution command prompt rather than a Ubuntu command prompt.
5. If you no longer want the Debian distribution installed on your computer, you can unregister it by using wslconfig.exe /unregister Debian.

Note that when you unregister a Linux distribution, all data, settings, and software associated with that distribution will be permanently lost. Reinstalling from Microsoft Store will install a clean copy.