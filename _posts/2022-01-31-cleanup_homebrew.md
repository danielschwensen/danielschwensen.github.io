---
layout: post
title: "Clean Up Old Homebrew Files"
date: 2022-01-31
categories: blog
tags: Homebrew macOS
---
# Clean Up Old Homebrew Files

Homebrew is a free, open-source software package management system that simplifies the installation of software on Apple’s macOS operating system and Linux.

If you've been using Homebrew for a while, you may have built up some cruft in the form old and outdated files. These will not be cleaned up automatically. You have do tell Homebrew to do so. This can be done with the following command.

```
$ brew cleanup
```

This command will report what files it cleans up as well as how much disk space it was able to clear.

You can also scrub the cache, including downloads for even the latest versions and downloads for any installed formulae or casks.

```
rm -rf "$(brew --cache)"
```
