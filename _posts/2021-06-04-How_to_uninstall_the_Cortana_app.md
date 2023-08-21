---
layout: post
title: "How to uninstall the Cortana app with Powershell"
date: 2021-06-04
categories: blog OS
tags: Windows Powershell
---
The following guide provides a simple and straightforward method to uninstall the Cortana app using Windows PowerShell.

- Open the Start Menu and type in PowerShell.
- Right click on Windows PowerShell.
- Select 'Run as administrator'.
- Type the following text:
````powershell
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage
````
- Press Enter.
