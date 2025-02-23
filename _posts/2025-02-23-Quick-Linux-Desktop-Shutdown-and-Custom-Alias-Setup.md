---
layout: post
title: "Quick Linux Desktop Shutdown and Custom Alias Setup"
date: 2025-02-23
categories: blog linux
tags: Linux
---
Quick reference for shutting down Linux systems via terminal - both standard commands and how to create a custom shortcut (alias 'sd') for faster access. Added this because I always forget the exact shutdown commands and the alias setup steps.

The quickest ways to shut down your Linux system via terminal:
- shutdown now - safest method, properly saves data
- poweroff - short command, similar to shutdown now
- init 0 - classic Unix command, works on all systems
- halt - stops all processes and system

Create Custom Alias

To set up a convenient shutdown alias:
1. Open .bashrc:
```
nano ~/.bashrc
```
2. Add at the end:
```
alias sd='shutdown now'
```
3. Save file: CTRL + O, ENTER, CTRL + X
4. Reload .bashrc:
```
source ~/.bashrc
```
Now you can simply type sd to shutdown your system.
Pro tip: Consider using alias sd='sudo shutdown now' if you always need root privileges.
