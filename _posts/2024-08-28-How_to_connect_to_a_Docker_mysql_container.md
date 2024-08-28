---
layout: post
title: "How to connect to a Docker mysql container?"
date: 2024-08-28
categories: development OS
tags: Docker
---
Verifying your MySQL Docker container connection.

First, make sure your MySQL container is actually running:

```
docker ps | grep mysql
```

Verify the port mapping:
```
docker port <container_id_or_name>
```

This should show you something like 3306/tcp -> 0.0.0.0:3306

Try connecting with the IP address 127.0.0.1:

```
mysql -h 127.0.0.1 -P <mapped_port> -u root -p
```

If you're still having trouble, you can always connect to MySQL from within the container itself:
```
docker exec -it <container_id_or_name> mysql -u root -p
```

If the connection is successful, you'll see the MySQL prompt, which typically looks like this:
```
mysql>
```

This indicates that the MySQL server is up and running, and you've successfully connected as the root user.

To further verify the connection and server status, you can run a few simple commands:

1. Check the server version:
```
SELECT VERSION();
```

2. Show the current date and time on the server:
```
SELECT NOW();
```

3. List all databases:
```
SHOW DATABASES;
```

If these commands execute without errors, it confirms that the MySQL server is functioning correctly.
To exit the MySQL prompt, type:
```
EXIT;
```