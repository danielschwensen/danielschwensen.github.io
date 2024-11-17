---
layout: post
title: "Understanding Linux Shells and Configuration"
date: 2024-11-17
categories: blog linux
tags: Linux shell bash
---
How to check which shell I'm using and where the important config files are located. 

# Which shell am I using?


Check your current shell using any of these commands:

```
echo $SHELL      # Shows path to default shell

echo $0         # Shows shell name

cat /etc/shells # Lists all available shells
```

# Changing your shell


Change your default shell using:

```
chsh -s /bin/zsh  # Change to ZSH

chsh -s /bin/bash # Change to Bash
```
Changes take effect after next login.

Shell Configuration Files


Key configuration files and their purposes:
1. ~/.bashrc
	- For interactive non-login shells
	- Contains: aliases, functions, prompt settings
	- Used in most terminal windows you open
2. ~/.profile
	- For login shells
	- Contains: environment variables, PATH settings
	- Read by multiple shells, not just bash
3. /etc/passwd
	- Stores default shell for each user
	- Format: `username:x:uid:gid:comment:home:shell`
	- Don't edit directly; use `chsh` instead

# Loading Order


Login Shell:
1. /etc/profile
2. First found of: ~/.profile, ~/.bash_login, or ~/.bash_profile
3. On exit: ~/.bash_logout

Non-Login Shell (regular terminal):
1. /etc/bash.bashrc
2. ~/.bashrc

On Ubuntu, ~/.bashrc is the main configuration file you'll work with for most shell customizations.