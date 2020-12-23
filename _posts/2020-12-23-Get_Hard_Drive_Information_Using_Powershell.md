---
layout: post
title: "Get Hard Drive Information Using Powershell"
date: 2020-12-23
categories: Scripting
tags: Powershell
---

On Windows you can use Powershell to obtain information about disks and partitions, apart from the classic tools like the Disk Management Utility or Diskpart.

The corresponding Powershell cmdlets can be retrieved with the following command:

````powershell 
Get-Command -Module Storage -Name Get*
````


* **Get-PhysicalDisk** allows you to get information about physical disks, device characteristics. 
* **Get-Disk display** gets disk information at the logical level of the operating system. 
* **Get-Partition** shows partition information on all drives. 
* **Get-Volume** displays volume information on all disks.

Exp.

```powershell
Get-PhysicalDisk |ft -Wrap
```
![Get-PhysicalDisk]({{ "/assets/2020/Get-PhysicalDisk.png" | absolute_url }})

```powershell
Get-Disk
```
![Get-Disk]({{ "/assets/2020/Get-Disk.png" | absolute_url }})

```powershell
Get-Partition
```
![Get-Partition]({{ "/assets/2020/Get-Partition.png" | absolute_url }})

```powershell
Get-Volume
```
![Get-Volume]({{ "/assets/2020/Get-Volume.png" | absolute_url }})