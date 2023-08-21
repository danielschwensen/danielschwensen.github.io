---
layout: post
title: "Attach an AWS EFS Volume on Linux via IP"
date: 2021-08-07
categories: blog linux
tags: Linux AWS EFS NFS
---
Following a step-by-step process to attach an AWS EFS volume to a Linux system using an IP address.


Check you current layout

```
lsblk
```

Create montpoint/directory

```
sudo mkdir /data
```

Add filesystem to fstab

![EFS 1]({{ "/assets/2021/EFS_1.png" | absolute_url }})


Mount filesystem

```
sudo mount -a
```

Validate with mount

```
mount
```

![EFS 2]({{ "/assets/2021/EFS_2.png" | absolute_url }})


Validate with df

```
df -h
```

![EFS 3]({{ "/assets/2021/EFS_3.png" | absolute_url }})