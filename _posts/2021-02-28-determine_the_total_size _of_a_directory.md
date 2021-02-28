---
layout: post
title: "How to determine the total size of a directory (folder) from the command line"
date: 2021-02-28
categories: blog linux
tags: Linux
---
The command du "summarizes disk usage of each FILE, recursively for directories," e.g.

```
du -hs /path/to/directory
```

-h is to get the numbers "human readable", e.g. get 140M instead of 143260 (size in KBytes)

-s is for summary (otherwise you'll get not only the size of the folder but also for everything in the folder separately)

List of all the folders in /path/to/folder and their sizes.
```
du -h --max-depth=1 /path/to/folder
```

List from smallest to largest.
```
du -h --max-depth=1 /path/to/folder | sort -nk1 
```