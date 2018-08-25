---
layout: post
title: "Create Vagrant Box from Scratch"
date: 2018-08-25
---

## Requirements

Virtual Box and Vagrant needs to be installed and configured first!

I am gonna be using the Ubuntu base image "Ubuntu 18.04, Bionic Beaver"

Create a new folder were you can store your OS image and Vagrant file.


```
mkdir VagrantUbuntuBox
cd VagrantUbuntuBox
```
Download the iso

```
curl http://archive.ubuntu.com/ubuntu/dists/bionic/main/installer-amd64/current/images/netboot/mini.iso -o Ubuntu-mini.iso
```

## Virtual Box

Create a new vm

![01]({{ "/assets/20180525-CreateVagrantBoxFromScratch-01" | absolute_url }})

![02]({{ "/assets/20180825-CreateVagrantBoxFromScratch/02.png" | absolute_url }})

![03]({{ "/assets/20180825-CreateVagrantBoxFromScratch/03.png" | absolute_url }})

![04]({{ "/assets/20180825-CreateVagrantBoxFromScratch/04.png" | absolute_url }})

![05]({{ "/assets/20180825-CreateVagrantBoxFromScratch/05.png" | absolute_url }})


## VM Settings

Disable audio and USB.

Set network to NAT and add port forwarding for SSH.

![06]({{ "/assets/20180825-CreateVagrantBoxFromScratch/06.png" | absolute_url }})

Select your iso image.

![07]({{ "/assets/20180825-CreateVagrantBoxFromScratch/07.png" | absolute_url }})

Start the vm and confirm the default settings during the installation.

user = vagrant
pw = vagrant

Use entire disk
Install automatic updates

![08]({{ "/assets/20180825-CreateVagrantBoxFromScratch/08.png" | absolute_url }})

Don't forget to remove the iso, after finishing the installation.

Now you should be able to log in with user vagrant

![09]({{ "/assets/20180825-CreateVagrantBoxFromScratch/09.png" | absolute_url }})

Although vagrant is a superuser you don't want to type sudo < command > all the time.

To prevent that:

```
sudo su -
visudo -f /etc/sudoers.d/vagrant
```
and add
```
vagrant ALL=(ALL) NOPASSWD:ALL
```
Adding insecure Keypair from https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub

```
mkdir /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub
mv vagrant.pub authorized_keys
chmod 0600 authorized_keys
cd ../
chown -R vagrant .ssh/
```

## SSH CONFIG

open

```
vi /etc/ssh/sshd_config
```

and add to the end of the file

```
AuthorizedKeysFile %h/.ssh/authorized_keys
```

Restart the ssh serice

```
service ssh restart
```

Install the following additional packages

```
apt-get install -y gcc build-essential git linux-headers-$(uname -r) dkms
```

## Install Virtual Box Guest Additions

Insert Guest Additions CD image from Devices menu

```
mount /dev/cdrom /mnt
cd /mount
./VBoxLinuxAdditions.run
```

Zero out the disk to fix fragmentation issues and to compress the disk easier

```
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
```

## Create your box

![10]({{ "/assets/20180825-CreateVagrantBoxFromScratch/10.png" | absolute_url }})
![11]({{ "/assets/20180825-CreateVagrantBoxFromScratch/11.png" | absolute_url }})

Run

```
vagrant init ubuntu64 -m
vagrant up
```

![12]({{ "/assets/20180825-CreateVagrantBoxFromScratch/12.png" | absolute_url }})

You now should be able to access your box via ssh

```
vagrant ssh
```