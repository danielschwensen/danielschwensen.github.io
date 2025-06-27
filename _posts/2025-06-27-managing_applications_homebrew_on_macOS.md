---
layout: post
title: "Managing Installed Applications with Homebrew on macOS"
date: 2025-06-27
categories: blog
tags: Homebrew macOS
---


Homebrew is a powerful package manager for macOS that allows users to install and manage software efficiently. In this article, we’ll explore how to list installed applications and remove unnecessary ones using Homebrew.

Listing Installed Packages

To see what software is installed via Homebrew, run:
```
brew list

```
This command displays all installed formulae (command-line tools and libraries). If you also want to see GUI applications installed via Homebrew Cask, use:
```
brew list --cask

```
This will show a list of applications installed using Cask, such as web browsers, terminal emulators, and text editors.

Uninstalling Unnecessary Applications

To remove an installed package, use:
```
brew uninstall <package-name>

```
For example, to remove Visual Studio Code:
```
brew uninstall --cask visual-studio-code

```
If you want to remove multiple packages at once:
```
brew uninstall --cask iterm2 kap keka

```
To remove all installed Cask applications:
```
brew list --cask | xargs brew uninstall --cask

```

Cleaning Up

After uninstalling applications, it’s a good idea to free up disk space with:
```
brew cleanup

```
This removes outdated versions and unnecessary files.
By following these steps, you can efficiently manage your macOS applications using Homebrew, ensuring your system stays clean and optimized.
