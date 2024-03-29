---
layout: post
title: "Create Vagrant Box from Scratch"
date: 2018-08-25
categories: blog development DevOps
tags: Vagrant code Linux install
---
The world of virtualization offers countless possibilities, allowing developers and system administrators to replicate environments, test software configurations, and more, all without needing physical machines. One of the most powerful tools in this space is Vagrant. Although it’s primarily used for provisioning and managing virtual machines (VMs), a frequently asked question is: How do you create your own Vagrant box? In this blog post, we'll be diving deep into this topic. Starting with the basics, we will craft a custom Vagrant box using VirtualBox and an Ubuntu 18.04, Bionic Beaver base image. Whether you're new to Vagrant or looking to expand your toolkit, this step-by-step guide will walk you through the process from start to finish.

## Requirements

Virtual Box and Vagrant needs to be installed and configured first!

I am gonna be using the Ubuntu base image "Ubuntu 18.04, Bionic Beaver"

Create a new folder were you can store your OS image and Vagrant file.


{% highlight Powershell %}
mkdir VagrantUbuntuBox
cd VagrantUbuntuBox
{% endhighlight %}

Download the iso

{% highlight Powershell %}
curl http://archive.ubuntu.com/ubuntu/dists/bionic/main/installer-amd64/current/images/netboot/mini.iso -o Ubuntu-mini.iso
{% endhighlight %}


## Virtual Box

Create a new vm

![01]({{ "/assets/20180825-CreateVagrantBoxFromScratch-01.png" | absolute_url }})

![02]({{ "/assets/20180825-CreateVagrantBoxFromScratch-02.png" | absolute_url }})

![03]({{ "/assets/20180825-CreateVagrantBoxFromScratch-03.png" | absolute_url }})

![04]({{ "/assets/20180825-CreateVagrantBoxFromScratch-04.png" | absolute_url }})

![05]({{ "/assets/20180825-CreateVagrantBoxFromScratch-05.png" | absolute_url }})


## VM Settings

Disable audio and USB.

Set network to NAT and add port forwarding for SSH.

![06]({{ "/assets/20180825-CreateVagrantBoxFromScratch-06.png" | absolute_url }})

Select your iso image.

![07]({{ "/assets/20180825-CreateVagrantBoxFromScratch-07.png" | absolute_url }})

Start the vm and confirm the default settings during the installation.

user = vagrant

pw = vagrant

Use entire disk

Install automatic updates

![08]({{ "/assets/20180825-CreateVagrantBoxFromScratch-08.png" | absolute_url }})

Don't forget to remove the iso, after finishing the installation.

Now you should be able to log in with user vagrant

![09]({{ "/assets/20180825-CreateVagrantBoxFromScratch-09.png" | absolute_url }})

Although vagrant is a superuser you don't want to type sudo < command > all the time.

To prevent that:

{% highlight Powershell %}
sudo su -
visudo -f /etc/sudoers.d/vagrant
{% endhighlight %}

and add

{% highlight Powershell %}
vagrant ALL=(ALL) NOPASSWD:ALL
{% endhighlight %}

Adding insecure Keypair from https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub

{% highlight Powershell %}
mkdir /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub
mv vagrant.pub authorized_keys
chmod 0600 authorized_keys
cd ../
chown -R vagrant .ssh/
{% endhighlight %}

## SSH CONFIG

open

```
vi /etc/ssh/sshd_config
```

and add to the end of the file

```
AuthorizedKeysFile %h/.ssh/authorized_keys
```

Restart the ssh service

```
service ssh restart
```

Install the following additional packages

```
apt-get install -y gcc build-essential git linux-headers-$(uname -r) dkms
```

## Install Virtual Box Guest Additions

Insert Guest Additions CD image from Devices menu

{% highlight Powershell %}
mount /dev/cdrom /mnt
cd /mount
./VBoxLinuxAdditions.run
{% endhighlight %}

Zero out the disk to fix fragmentation issues and to compress the disk easier

{% highlight Powershell %}
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
{% endhighlight %}

## Create your box

![10]({{ "/assets/20180825-CreateVagrantBoxFromScratch-10.png" | absolute_url }})
![11]({{ "/assets/20180825-CreateVagrantBoxFromScratch-11.png" | absolute_url }})

Run

{% highlight Powershell %}
vagrant init ubuntu64 -m
vagrant up
{% endhighlight %}

![12]({{ "/assets/20180825-CreateVagrantBoxFromScratch-12.png" | absolute_url }})

You now should be able to access your box via ssh

{% highlight Powershell %}
vagrant ssh
{% endhighlight %}