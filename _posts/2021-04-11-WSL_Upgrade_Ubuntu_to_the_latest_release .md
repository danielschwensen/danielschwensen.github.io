---
layout: post
title: "WSL - Upgrade Ubuntu to the latest release "
date: 2021-04-11
categories: OS
tags: Linux WSL Ubuntu
---
Even if you use the distro apps for [WSL](https://danielschwensen.github.io/2019-04-07-Enable-Windows-Subsystem-for-Linux-on-Windows/) you can upgrade to the latest release.

The following steps did the trick:

Verify your release before the upgrade

```
cat /etc/lsb-release
```

1. Apply all updates of installed packages

```
sudo apt update
sudo apt upgrade -y
```

2. Remove unused Kernels and install ‘update-manager-core’

```
sudo apt --purge autoremove
sudo apt install update-manager-core -y
```

3. Start Upgrade Process

```
sudo do-release-upgrade
```

As the Linux environment apps such as Ubuntu or Debian do not support the Systemd that provides fundamental building blocks for a Linux operating system, we can’t use reboot or use the systemctl commands to manage the systemd services. 
So in order to restart WSL we need to restart the Lxssmanager service.

```
Get-Service LxssManager | Restart-Service
```

Verify your release after the upgrade

```
cat /etc/lsb-release
```