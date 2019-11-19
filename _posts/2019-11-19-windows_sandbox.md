---
layout: post
title: "Enable Windows 10 Sandbox with PowerShell"
date: 2019-11-19
categories: blog Windows
tags: Powershell Windows
---
Windows Sandbox is perfect if you need to download and install an unknown executable in an isolated, temporary desktop environment where you can run untrusted software without the fear of lasting impact to your PC.
Any software installed in Windows Sandbox stays only in the sandbox and cannot affect your host. Once Windows Sandbox is closed, all the software with all its files and state are permanently deleted.

Features:

- Part of Windows – everything required for this feature ships with Windows 10 Pro and Enterprise. No need to download a VHD!
- Windows Sandbox runs as a clean new installation of Windows
- Disposable – nothing persists on the device; everything is discarded after you close the application
- Secure – uses hardware-based virtualization for kernel isolation, which relies on the Microsoft’s hypervisor to run a separate kernel which isolates Windows Sandbox from the host
- Efficient – uses integrated kernel scheduler, smart memory management, and virtual GPU

Windows Sandbox has the following pre-requisites:

- Windows 10 Pro or Enterprise build 18305 or later
- AMD64 architecture
- Virtualization capabilities enabled in BIOS

Enable Windows 10 Sandbox via PowerShell

Note!
Before proceeding, you need to enable virtualization, as follows:

- If you are using a physical machine, ensure virtualization capabilities are enabled in the BIOS.
- If you are using a virtual machine, enable nested virtualization with the following PowerShell command:

````powershell
Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $true
````

Enable Sandbox as Admin:

````powershell
Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online
````

Now you can search (Windows + Q) for Sandbox and open it.

![Sandbox](/assets/2019/11/sandbox.png)
