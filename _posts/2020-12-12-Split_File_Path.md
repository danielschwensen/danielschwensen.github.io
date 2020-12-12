---
layout: post
title: "How to Split a File Path with Powershell"
date: 2020-12-12
categories: Scripting
tags: Powershell
---

When working with file names, it is sometimes necessary to extract the individual parts such as drive, path or name from them.

The following examples are mostly based on the $PROFILE path

````powershell 
❯ $PROFILE
F:\OneDrive\Dokumente\PowerShell\Microsoft.PowerShell_profile.ps1
````

Default Split-Path command retrieves the parent folder name of the file.

```powershell
❯ Split-Path $PROFILE
F:\OneDrive\Dokumente\PowerShell
```

The default parameter is -Parent

```powershell
❯ Split-Path $PROFILE -Parent
F:\OneDrive\Dokumente\PowerShell
```

Get the qualifier of a path

```powershell
❯ Split-Path $PROFILE -Qualifier
F:
```

Use the -Leaf parameter if you only need file name

```powershell
❯ Split-Path $PROFILE -Leaf
Microsoft.PowerShell_profile.ps1
```

Get all file names in a directory

```powershell
❯ Split-Path (Get-ChildItem -Path E:\temp\ -File) -Leaf -Resolve
1 (1).txt
1 (2).txt
56.txt
asci_fun.txt
asci_fun2.txt
```

This can be done by Get-ChildItem only

```powershell
❯ gci E:\temp\ -Name -File
1 (1).txt
1 (2).txt
56.txt
asci_fun.txt
asci_fun2.txt
```