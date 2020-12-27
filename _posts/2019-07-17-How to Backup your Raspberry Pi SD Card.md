---
layout: post
title: "How to Backup your Raspberry Pi SD Card on Windows?"
date: 2019-07-17
categories: blog Raspberry_Pi 
tags: Raspberry_Pi
---

**Backing up your Raspberry Pi to a computer using an SD Card Reader**

If, like me, you want to try out new software or install the latest operating system version directly, it makes a lot of sense to back up the SD card of your Raspberry Pi regularly so that the system can be restored quickly in case of an emergency.

By the way: The regular backup of the most important files is unaffected by this.

To back up our Raspberry Pi’s SD Card on Windows I recommend utilizing the imaging tool that is called [win32diskimager](https://sourceforge.net/projects/win32diskimager/).

Win32diskimager is a useful tool that can read and write images to USB Sticks or SD/CF Cards.

**Shutdown**

You should shutdown you system with the command `sudo shutdown -h now` to ensure that the system is stopped properly.
It will do the following steps to ensure the operating system shutdowns gracefully.

1. It will send SIGTERM to all the running processes, so they can save and exit gracefully.
2. After an interval, it sends SIGKILL, so that any remaining processes will be halted.
3. Lastly, it will unmount all the file systems.
4. The screen will now show System Halted.
5. You can now remove the power cord with minimal risk to your Raspberry Pi and the operating system.

**Backing up your Raspberry Pi SD Card on Windows**

1. Start _win32diskimager_
2. Define Image File like _MyPiBacku.img_
3. Select Device (if your Pi has multiple partitions, select the first one -the process will still clone the full SD card and not just the single partition) 
4. Click on Read (this step can take some time)

That's it. The restore process is - you guessed it - just the other way around