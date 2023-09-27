---
layout: post
title: "How to check on Linux if Docker is running"
date: 2023-09-27
categories: blog linux
tags: Linux Docker
---
Docker is a popular tool for developing and running applications in containers. It can be used on a variety of platforms, including Linux.

There are a few ways to check if Docker is running on Linux.

1. Use the systemctl command.

```
sudo systemctl status docker
```

If the Docker daemon is running, you will see an output similar to this:



```
● docker.service - Docker Application Container Engine
 Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
 Active: active (running) since Wed 2023-08-03 14:27:03 UTC; 3h 3min ago
 Main PID: 1326 (dockerd)
  Tasks: 27
 Memory: 15.4M
  CPU: 8ms
 CGroup: /system.slice/docker.service
   └─1326 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
```



2. Use the docker info command.

```
docker info
```

If the Docker daemon is running, you will see an output similar to this:


```
Client:
 Version:           20.10.8
 ...

Server:
 Version:           20.10.8
 ...
```


3. Check the process ID of the Docker daemon.

	The Docker daemon writes its process ID to the file /var/run/docker.pid. You can check if the Docker daemon is running by checking if this file exists and if the process ID associated with it is running.

```
sudo cat /var/run/docker.pid
```

If the Docker daemon is running, you will see a number. If the number is not running, the Docker daemon is not running.