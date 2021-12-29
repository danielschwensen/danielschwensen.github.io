---
layout: post
title: "Install and Configure the AWS CLI on Windows"
date: 2021-12-29
categories: blog AWS
tags: AWS CLI Windows install
---
# Installation

Open the command prompt and run the following two commands:

```
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
```

```
aws configure 
```

Enter the access key ID and secret access key with eu-west-1 as the region and json as the default output format.

Verify if tools are installed:

```
aws --version
```

# Testing

aws s3 ls

# Notes

Region Name: EU (Frankfurt)
Region Code: eu-central-1

Region: EU(Ireland)
Region Code: eu-west-1