---
layout: post
title: "AWS - How to search for IP addresses - CLI"
date: 2022-06-30
categories: blog Cloud
tags: AWS CLI network
---
How to find out which resource owns this IP in AWS.

Private IP
```
aws ec2 describe-network-interfaces --filters Name=addresses.private-ip-address,Values=10.0.0.0 --region eu-west-1
```

Public IP
```
aws ec2 describe-network-interfaces --filters Name=addresses.association.public-ip,Values=1.1.1.1 --region eu-west-1
```

Source:
https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-network-interfaces.html

https://aws.amazon.com/de/premiumsupport/knowledge-center/vpc-find-owner-unknown-ip-addresses/
