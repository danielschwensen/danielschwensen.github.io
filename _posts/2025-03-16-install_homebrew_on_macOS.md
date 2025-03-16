---
layout: post
title: "Install Homebrew on macOS Ventura"
date: 2025-03-16
categories: blog
tags: Homebrew macOS
---

Homebrew is a free and open-source package manager that simplifies the installation of software on macOS and Linux.  It allows users to install, update, and manage software packages directly from the command line, making it easier to handle dependencies and maintain system cleanliness. 

# Installing Homebrew on macOS 13 Ventura

To install Homebrew on macOS 13 Ventura, follow these steps:
Install Xcode Command Line Tools: Execute: 
```
xcode-select --install
```
A prompt will appear; click ‘Install’ to proceed.

Install Homebrew: Run: 
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
This script will download and install Homebrew.

Adding Homebrew to Your PATH
To ensure that Homebrew and its installed packages are accessible from the terminal, you need to add Homebrew to your shell’s PATH. This step is crucial for the proper functioning of Homebrew. Here’s how to do it: 
	1.	Determine Your Shell:
```
echo $SHELL
```

If the output includes /bin/zsh, you’re using zsh. If it shows /bin/bash, you’re using bash.

Add Homebrew to the PATH:
For zsh Users:
Open (or create) your .zprofile file:
```
nano ~/.zprofile
```

Add the following line to the file:
```
eval "$(/opt/homebrew/bin/brew shellenv)"
```

For bash Users:
Open (or create) your .bash_profile file:
```
nano ~/.bash_profile
```

Add the following line to the file:
```
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Apply the Changes:
To immediately apply the changes without restarting the terminal, run:
```
source ~/.zprofile
```
or
```
source ~/.bash_profile
```
depending on your shell.

By following these steps, Homebrew will be added to your PATH, ensuring that you can use the brew command and access the software installed via Homebrew seamlessly.

# Verify Installation: After installation, confirm that Homebrew is set up correctly by running:
```
brew doctor
```
If everything is properly installed, you’ll see the message “Your system is ready to brew.”

# Uninstalling Homebrew

If you need to uninstall Homebrew, execute the following command in Terminal:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```
This command will remove Homebrew and all installed packages from your system.
