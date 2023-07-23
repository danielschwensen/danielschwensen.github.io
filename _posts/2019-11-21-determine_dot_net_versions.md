---
layout: post
title: "A Quick Guide to Identifying Installed .NET Framework Versions"
date: 2019-11-21
categories: OS Scripting
tags: Powershell Windows
---
As developers, understanding which versions of the .NET Framework are installed on a system can be crucial for various tasks. Whether you're debugging, deploying, or setting up a new environment, knowing the exact versions at hand can save time and prevent compatibility issues. Following two simple methods – using Powershell and the Registry Editor – to help you pinpoint all the .NET versions installed on your machine.

**Powershell** 

````powershell  
gci $env:Windir\Microsoft.Net\framework | Where {$_.Mode -match "d"} | ft -auto
````

**Registry Editor**

To find .NET Framework versions by viewing the registry (.NET Framework 1-4)

- On the Start menu, choose Run.
- In the Open box, enter regedit.
- In the Registry Editor, open the following subkey: HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP

The installed versions are listed under the NDP subkey. The version number is stored in the Version entry. For the .NET Framework 4 the Version entry is under the Client or Full subkey (under NDP), or under both subkeys.
