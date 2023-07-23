---
layout: post
title: "Installing Packer on CentOS"
date: 2018-08-26
categories: blog development DevOps
tags: Packer code Linux install
---
For those venturing into the world of automated machine image creation, HashiCorp's Packer offers a versatile tool to make the process efficient and consistent. While there are various operating systems and platforms on which one might install Packer, this post specifically focuses on CentOS 7.

Requirements:
- unzip
- wget

## Installing Packer

Move to /usr/local/bin, download and unpack packer.


{% highlight Powershell %}
cd /usr/local/bin/
wget https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_amd64.zip
unzip packer_1.2.5_linux_amd64.zip
rm -f packer_1.2.5_linux_amd64.zip
cd
packer --version
{% endhighlight %}

Now you can start creating a template.
