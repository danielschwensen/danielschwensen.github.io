---
layout: post
title: "How to uninstall the Cortana app with Powershell"
date: 2021-06-04
categories: blog OS
tags: Windows Powershell
---
- Open the Start Menu and type in PowerShell.
- Right click on Windows PowerShell.
- Select 'Run as administrator'.
- Type the following text:
````powershell
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage
````
- Press Enter.
