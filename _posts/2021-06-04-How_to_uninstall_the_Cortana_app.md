---
layout: post
title: "How to uninstall the Cortana app"
date: 2021-06-04
categories: blog Windows
tags: Windows
---
- Open the Start Menu and type in PowerShell.
- Right click on Windows PowerShell.
- Select 'Run as administrator'.
- Type the following text:
````powershell
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage
````
- Press Enter.
