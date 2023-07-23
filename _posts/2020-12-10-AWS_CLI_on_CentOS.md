---
layout: post
title: "Install and configure AWS CLI on CentOS"
date: 2020-12-10
categories: Cloud OS
tags: AWS CentOS CLI Linux install
---
````bash
sudo yum install epel-release
sudo yum install python-pip
sudo pip install awscli
````

Run aws configure and enter the access key ID and secret access key you noted down earlier in the lesson, with us-east-1 as the region and json as the default output format.

# Testing

````bash
aws s3 ls
````