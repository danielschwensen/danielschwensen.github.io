---
layout: post
title: "CPU stress tools"
date: 2022-02-27
categories: blog OS tools
tags: Linux Windows cpu Sysinternals
---
There are many reasons why you may want to stress test the CPU on your system. You may want to see how your operating system and hardware perform when you are at full CPU utilization or you want to trigger resource monitoring alerts.

# Linux

stress

Enter the following command where the number used in --cpu is the amount of threads to start. To fully stress the CPU, this should be the total number of CPU cores or double that if the CPU supports hyper-threading. You can obtain the appropriate number to use by entering getconf _NPROCESSORS_ONLN. 

```
stress --cpu 8
```

# Windows

CpuStres

![CpuStres]({{ "/assets/2022/CPU_STRESS.png" | absolute_url }})

https://docs.microsoft.com/en-us/sysinternals/downloads/cpustres