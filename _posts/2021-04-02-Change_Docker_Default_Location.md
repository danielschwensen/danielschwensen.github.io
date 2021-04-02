---
layout: post
title: "Change Docker Default Location"
date: 2021-04-02
categories: developmen OS
tags: Docker WSL Windows
---
Docker Desktop for Windows is great since you can switch between Linux and Windows seamlessly.

Unfortunately, during the installation, you are not offered the possibility to set the default directory. 
This leads to the system drive filling up sooner or later if you do a lot of experimenting.

 
Following how to change the default location:


# Windows

 
Defautl location: %PROGRAMDATA%/Docker
 
1. Stop Docker
2. Create new destination on different drive

```
mkdir D:\Docker_Windows
```

3. Add "data-root": "D:\\Docker_Windows" to C:\ProgramData\Docker\config\daemon.json
4. Start Docker


# Linux

 
Default location: %LOCALAPPDATA%/Docker 
 
1. Stop Docker
2. Shutdown all WSL distros
```
wsl --shutdown
```
3. Export docker-desktop-data to tar file
```
wsl --export docker-desktop-data D:\docker-desktop-data.tar
```
4. Unregister current docker-desktop-data distro
```
wsl --unregister docker-desktop-data
```
5. Import docker-desktop-data distro from tar file
```
wsl --import docker-desktop-data D:\Docker_WSL\data D:\docker-desktop-data.tar --version 2
```
6. Start Docker
7. Remove D:\docker-desktop-data.tar (if the import was successful)