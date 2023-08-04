---
layout: post
title: "Using PowerShell PSReadLine"
date: 2023-08-04
categories: Scripting
tags: Powershell
---
**PSReadLine**, a module that offers improved command-line editing and rich history capabilities.

### **Installation**

Before using PSReadLine, you need to have it installed. It often comes pre-installed with Windows 10 and PowerShell Core, but if you need to install it manually:

```powershell
Install-Module -Name PSReadLine -Force -SkipPublisherCheck
```

### **Basic Features**

**Syntax Highlighting:** 

Out of the box, PSReadLine offers real-time syntax highlighting, making it easier to spot mistakes as you type.

**Keyboard Shortcuts:** 

PSReadLine comes packed with a variety of shortcuts, similar to those in `bash`, that can make navigation and command editing a breeze.

- **Ctrl + Arrow Keys:** Navigate through tokens (words).
- **Ctrl + A:** Move to the start of the line.
- **Ctrl + E:** Move to the end of the line.

### **Command History**

One of PSReadLine's most robust features is its enhanced history management.

**Persistent History:** 

Commands are saved across sessions, so you can recall commands you used days or even weeks ago.

**Search History:** 

Easily search through your command history by pressing **Ctrl + R**. Start typing, and PSReadLine will show matches from your history.

![PSReadLine]({{ "/assets/2023/PSReadLine.png" | absolute_url }})

### **Customization**

PSReadLine is highly customizable. To edit the settings:

```powershell
notepad.exe $PROFILE
```

This will open your PowerShell profile in Notepad, where you can customize PSReadLine to your liking. 

**Prediction Based on History:** You can set PSReadLine to predict the next command based on your history using:

```powershell
Set-PSReadLineOption -PredictionSource History
```

**View Style for Predictions:** You can customize the view of the predictions. For a list view style, use:

```powershell
Set-PSReadLineOption -PredictionViewStyle ListView
```

### **MindMap**

![PSReadLineMindMap]({{ "/assets/2023/PSReadLine.svg" | absolute_url }})

### **Conclusion**

**PSReadLine** is a must-have module for anyone regularly working with PowerShell. Its enhanced editing, history capabilities, and customization options can greatly improve your productivity.