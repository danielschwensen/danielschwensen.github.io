---
layout: post
title: "How to Install Git on Windows"
date: 2023-12-03
categories: development
tags: Git
---
Download Git: Visit the official Git website at git-scm.com to download the latest version for Windows.

# Installation Process

<img src="{{ "/assets/2023/Git-01.webp" | absolute_url }}"
     alt="Git setup enables Git Bash Here and Git GUI Here in Windows Explorer, Git LFS, and file associations for Git configuration and shell scripts" width="619" height="480"
     loading="eager" style="max-width: 100%; height: auto;">

<img src="{{ "/assets/2023/Git-02.webp" | absolute_url }}"
     alt="Visual Studio Code selected as the default Git editor" width="600" height="480"
     loading="lazy" style="max-width: 100%; height: auto;">

<img src="{{ "/assets/2023/Git-03.webp" | absolute_url }}"
     alt="Let Git decide selected for the initial branch name in new repositories" width="601" height="480"
     loading="lazy" style="max-width: 100%; height: auto;">

<img src="{{ "/assets/2023/Git-04.webp" | absolute_url }}"
     alt="Git added to PATH for the command line and third-party software" width="574" height="480"
     loading="lazy" style="max-width: 100%; height: auto;">

<img src="{{ "/assets/2023/Git-05.webp" | absolute_url }}"
     alt="Git set to check out Windows-style line endings and commit Unix-style line endings" width="561" height="480"
     loading="lazy" style="max-width: 100%; height: auto;">

<img src="{{ "/assets/2023/Git-06.webp" | absolute_url }}"
     alt="MinTTY selected as the terminal emulator for Git Bash" width="592" height="480"
     loading="lazy" style="max-width: 100%; height: auto;">

<img src="{{ "/assets/2023/Git-07.webp" | absolute_url }}"
     alt="Git pull set to fast-forward when possible and merge otherwise" width="571" height="480"
     loading="lazy" style="max-width: 100%; height: auto;">

<img src="{{ "/assets/2023/Git-08.webp" | absolute_url }}"
     alt="Git Credential Manager Core selected as the credential helper" width="623" height="480"
     loading="lazy" style="max-width: 100%; height: auto;">

<img src="{{ "/assets/2023/Git-09.webp" | absolute_url }}"
     alt="File system caching enabled and symbolic links left disabled" width="601" height="480"
     loading="lazy" style="max-width: 100%; height: auto;">

<img src="{{ "/assets/2023/Git-10.webp" | absolute_url }}"
     alt="Experimental pseudo console support left unchecked before clicking Install" width="600" height="480"
     loading="lazy" style="max-width: 100%; height: auto;">

# Post-Installation Steps


Verifying the Installation

- Open your command prompt or Git Bash terminal.
- Type git --version and press Enter. If Git is installed correctly, it should display the installed version.




# Configuring Git

- To personalize your Git environment, configure your user name and email using the following commands:
```
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

- These details will be used in your commits.