---
layout: post
title: "Get a Docker based Wordpress playground in a heartbeat"
date: 2019-08-31
categories: blog Wordpress Docker 
tags: Docker Wordpress docker-compose MySQL Powershell
---
Do you want to test the latest Wordpress version (including plug-ins and themes) without having to install a full development environment (Apache, MySQL,PHP etc.)?
If so, then Docker offers a simple solution to quickly commission and de-commission a WordPress \+ MySQL development environment in no time.

## Requirements

* [Docker](https://www.docker.com/)
* Docker Compose
* Powershell

## Installation & Configuration

1.
Start Powershell, create a directory and install the docker-compose.yaml file found in this [Github repository](https://github.com/danielschwensen/wordpress-docker-playground). 

You can get it via: 

    git clone https://github.com/danielschwensen/wordpress-docker-playground.git
    
    or

    wget -uri https://raw.githubusercontent.com/danielschwensen/wordpress-docker-playground/master/docker-compose.yaml -OutFile docker-compose.yaml

2.
Start the show by running the command `docker-compose up`.

This will launch the two containers and link them together. You will see logging to your terminal window. You can press Ctrl+C to stop the containers and get your command prompt back. To launch the containers in the background add a "-d".

3.
Connect to your new WordPress server at http://localhost:8080/

That's it.

Now you simply go through the normal WordPress installation process and within a few screens your new site will be fully active. 

`docker-compose stop` will stop the containers from running. Doing `docker-compose start` will start them up again.

WHEN YOU ARE DONE and want all this to go away, just type `docker-compose down` and the services will be stopped and the containers removed. 