---
layout: post
title: "How to Change the Creation Timestamp of JPG Files with PowerShell?"
date: 2024-09-12
categories: Scripting
tags: Powershell
---
Do you need to change the creation timestamps of JPG files? 
PowerShell offers a quick and efficient way to do this.

```
$targetPath = "F:\Downloads\Target"

$newCreationTime = "2001-09-11 00:00:00"

Get-ChildItem -Path $targetPath -Filter *.jpg | ForEach-Object {
    $_.CreationTime = $newCreationTime
    Write-Host "CreationTime for file $($_.Name) was changed to $newCreationTime"
}
```

You can also change other timestamps like LastWriteTime or LastAccessTime by using the corresponding property:

```
$_.LastWriteTime = $newCreationTime
```