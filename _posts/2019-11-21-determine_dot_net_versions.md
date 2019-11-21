---
layout: post
title: "How to determine all installed .Net versions"
date: 2019-11-21
categories: blog Windows
tags: Powershell Windows
---
Powershell 

````powershell  
gci $env:Windir\Microsoft.Net\framework | Where {$_.Mode -match "d"} | ft -auto
````

Registry Editor

To find .NET Framework versions by viewing the registry (.NET Framework 1-4)

- On the Start menu, choose Run.
- In the Open box, enter regedit.
- In the Registry Editor, open the following subkey: HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP

The installed versions are listed under the NDP subkey. The version number is stored in the Version entry. For the .NET Framework 4 the Version entry is under the Client or Full subkey (under NDP), or under both subkeys.
