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
winget install Netflix
```

Source: https://docs.microsoft.com/en-us/windows/package-manager/
