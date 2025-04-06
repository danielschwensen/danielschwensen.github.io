---
layout: post
title: "Extracting a Subdirectory with Git Subtree Split"
date: 2025-04-06
categories: development
tags: Git
---
When you need to split a subdirectory from a larger repository while keeping its commit history, Git Subtree Split is a simple built-in solution.

1. Update Your Local Repository

Before starting, ensure your repository is up-to-date. If you have any pending changes, commit them and pull the latest updates:

```
git pull origin main

```
(Replace `main` with your branch name if needed.)

2. Create a New Branch for the Subdirectory

Use the subtree split command to extract your subdirectory (e.g., `WizzadPlus2022`) into a new branch:

```
git subtree split --prefix=WizzadPlus2022 -b wizzadplus2022-only

```
- `--prefix=WizzadPlus2022`: Specifies the directory to extract.
- `-b wizzadplus2022-only`: Creates a new branch containing only the commits affecting that directory.

3. Set Up a New Repository

Create a new, empty repository on your favorite Git hosting service (GitHub, GitLab, etc.). Note the repository URL (e.g., git@github.com:`yourUsername/WizzadPlus2022.git`).

4. Push the New Branch to the New Repository

Add the new remote and push your branch:

```
git remote add wizzadplus2022 <NEW_REPO_URL>
git push wizzadplus2022 wizzadplus2022-only:main

```
This command pushes your new branch as the `main` branch in the new repository.