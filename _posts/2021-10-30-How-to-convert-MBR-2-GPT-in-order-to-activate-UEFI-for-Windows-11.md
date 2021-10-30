---
layout: post
title: "How to convert MBR 2 GPT in order to activate UEFI for Windows 11"
date: 2021-10-30
categories: OS
tags: Windows
---
In order to use Windows 11, UEFI + Secure Boot must be used. Fortunately, since Windows version 1703, it is no longer necessary to reinstall the operating system if you want to switch from BIOS (master boot record) to UEFI.

## Verify
First you have to check if you are still working with the legacy BIOS. This can be checked with the "Disk Management" tool as follows.

Right-click on the Windows installation disk and select “Properties.”

![Check-if-legacy-BIOS-DM]({{ "/assets/2021/Check-if-legacy-BIOS-DM.png" | absolute_url }})

![check-mbr]({{ "/assets/2021/check-mbr.png" | absolute_url }})

In the properties Window, go to the “Volumes” tab. You should see “Master Boot Record (MBR)” next to “Partition style”.
If it says “GUID Partition Table (GPT)”, then you’re already on UEFI and don’t need to do anything!

## Convert Legacy BIOS to UEFI

In order to run the following commands, access the Command Prompt from Windows’s advanced startup (click on the “Restart” button while holding the Shift key).

Validate if your disk can be converted.

```
mbr2gpt /validate
```

Execute the converting.

```
mbr2gpt /convert
```

After converting, restart your system and change your motherboard firmware settings from Legacy BIOS to UEFI.

More detailed information:

`https://docs.microsoft.com/de-de/windows/deployment/mbr-to-gpt`
