---
layout: post
title: "Make your terminal look great again"
date: 2019-12-26
categories: blog Windows
tags: Powershell Windows Terminal
---

![Windows Terminal]({{ "/assets/2019/12/WindowsTerminal.png" | absolute_url }})

If you want to look your Windows Terminal like this then you need to do the following:

Install posh-git and oh-my-posh:

````powershell  
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
````

In case you're running this on PS Core, make sure to also install version 2.0.0-beta1 of PSReadLine

````powershell  
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
````
Add the following to you profile (notepad $profile)

````powershell  
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox
````
Install fonts which includes glyphs and configure your Windows Terminal profile accordingly.

I personally use GoMono NF

https://www.nerdfonts.com/font-downloads