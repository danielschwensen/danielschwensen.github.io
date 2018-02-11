---
layout: post
title: "How to install and access MySQL on Qnap"
date: 2018-02-09
---

MariaDB

Install MariaDB via App Center

Enabling MySQL

QNAP Default Username/Password for MySQL

The default username for MySQL on your QNAP is “root” and the default password is “admin“.In case you changed the password of root and forgot what it was;
In the “Applications” → “SQL Server” page a “Reset root password” will allow you to reset it to it’s defaults.

phpMyAdmin

Also, you need to install  phpMyAdmin in order to administer your databases with a web browser.

![My helpful screenshot]({{ "/assets/2018-02-09-myPHPAdmin.png" | absolute_url }})

"Access: http://<ip of your NAS>/phpMyAdmin"

Workbench

Another option would be Workbench. MySQL Workbench provides data modeling, SQL development, and comprehensive administration tools for server configuration, user administration, backup, and much more.

https://www.mysql.com/de/products/workbench/

Note!
By default, MariaBD only allows connections from localhost. In order to allow connections from remote hosts, you have to add a user that is allowed to connect from something other than 'localhost'.

Exp:

GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.100.%' IDENTIFIED BY 'my-new-password' WITH GRANT OPTION;

This commant grants user 'root' permissions to connect from anywhere on the 192.168.100.0/24 LAN.

SSH

Bear in mind that only the user admin is allowed to connect via ssh to your Qnap device - if ssh is enabled.
