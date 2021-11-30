---
layout: post
title: "How to connect to EC2 via SSH + troubleshooting"
date: 2021-11-30
categories: blog AWS
tags: Linux AWS EC2 SSH
---
In general:
* Make sure the private key (pem file) on your Linux machine has 400 permissions or you will get an "Unprotected private key file" error.
* Make sure the username is given correctly when connecting via SSH, else you will get "Host key not found", "Permission denied", or "Connection closed" error.

Possible reasons for "Connection times out" to EC2 instance via SSH:
* SG is not configured correctly
* NACL ist not configured correctly
* Check the route table for the subnet
* Instance doesn't have a public IP
