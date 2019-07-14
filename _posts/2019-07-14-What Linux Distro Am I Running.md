---
layout: post
title: "What Linux Distro Am I Running?"
date: 2019-07-14
categories: blog linux
tags: Linux
---
If you work in a large company (and are more likely to work with Windows operating systems), you may end up on an unknown Linux system for troubleshooting purposes. To quickly find out which distribution is installed, the following commands may be helpful:

Viewing the release files:

```
$ cat /etc/*release*
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.2 LTS"
NAME="Ubuntu"
VERSION="18.04.2 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.2 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
```
Or try it with the issue files, if there wasn't a release file:

```
$ cat /etc/*issue*
Ubuntu 18.04.2 LTS \n \l

Ubuntu 18.04.2 LTS
```

If you don't want to rely on files then you can use tools as well:

**lsb_release**

```
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.2 LTS
Release:        18.04
Codename:       bionic
```

**hostnamectl**

**_hostnamectl_** runs only on **_systemd_** based Linux distributions.

```
$ hostnamectl
   Static hostname: ip-10-0-1-10
         Icon name: computer-vm
           Chassis: vm
        Machine ID: f89138299a734aec9037cb36dcca0fa2
           Boot ID: 37b19f42a105438e8cd113c0f9c38e78
    Virtualization: xen
  Operating System: Ubuntu 18.04.2 LTS
            Kernel: Linux 4.15.0-1034-aws
      Architecture: x86-64
```