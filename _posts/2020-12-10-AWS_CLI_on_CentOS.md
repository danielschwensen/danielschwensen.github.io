---
layout: post
title: "Install and configure AWS CLI on CentOS"
date: 2020-12-10
categories: Cloud OS
tags: AWS CentOS cli Linux install
---

{: .box-note}
**Historical guide (2020).** The steps below describe the older AWS CLI v1 installation via `pip` on CentOS. For a current installation, use the Linux section of the [official AWS CLI v2 installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and check its requirements for your distribution.

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
