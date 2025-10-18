---
layout: post
title: "Windows Package Manager WinGet in a Nutshell"
date: 2022-05-29
categories: blog OS
tags: Windows winget
---

The Windows Package Manager (also known as winget) is a free and open-source package manager designed by Microsoft for Windows 10 and Windows 11. It consists of a command-line utility and a set of services for installing applications.

Setting
```
winget settings
```

Choose store

```
-s msstore
```

List outdated packages

```
winget upgrade
```

Update package

```
winget upgrade <package name>
```

How to update all packages

```
winget upgrade --all
```

List all packages

```
winget list
```

List packages that start with a specific string

```
winget list | Select-String "^(?i)N" #"The prefix (?i) makes the search case-insensitive, so both N and n are matched
```

Export Installed Software list

```
winget export -o <Path to JASON file>
```

Import Installed Software list

```
winget import -i <Path to JASON file>
```

Search for packages

```
winget search Netflix
```

Install package

```
winget install <package name>
```

Uninstall package

```
winget uninstall <package name>
```

WinGet pin
Use winget pin to control upgrades of specific packages: exclude them from bulk upgrades, block all upgrades, or allow only a version/range.

Pinning: Skips the package in winget upgrade --all, but you can still upgrade it explicitly or include it with --include-pinned.

```
winget pin add <package name>
```

Unpinning: Removes the pin so the package is included in bulk upgrades.

```
winget pin remove <package name>
```

List all pins

```
winget pin list
```

Remove a pin

```
winget pin remove <package name>
```

Source: https://docs.microsoft.com/en-us/windows/package-manager/
