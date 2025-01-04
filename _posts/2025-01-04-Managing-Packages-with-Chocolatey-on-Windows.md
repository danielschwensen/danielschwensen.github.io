---
layout: post
title: "Managing Packages with Chocolatey on Windows"
date: 2025-01-04
categories: blog
tags: Windows Chocolatey
---
Chocolatey is a powerful package manager for Windows that simplifies software installation and management. 

Prerequisites

- Run PowerShell or Command Prompt as Administrator
- Installation directory: `C:\ProgramData\chocolatey`

Essential Commands


Installation & Updates


```
# Install a package
choco install <package-name>

# Update a specific package
choco upgrade <package-name>

# Update all packages
choco upgrade all -y
```

Package Management

```
# List installed packages
choco list

# Check for outdated packages
choco outdated

# Search for packages
choco search <package-name>

# Get package information
choco info <package-name>

# Uninstall a package
choco uninstall <package-name>
```

Example: Managing Terraform

```
# Install Terraform
choco install terraform

# Check Terraform version
terraform --version

# or
choco list terraform

# Update Terraform
choco upgrade terraform
```

Tips

1. Use `-y` flag to automatically confirm actions
2. Pin important packages to prevent automatic updates: 
3. Keep Chocolatey updated: 
4. Restart terminal after installing new packages
5. Use `--what-if` to preview changes before execution


Understanding Shims

Chocolatey uses shims to make command-line programs accessible globally. A shim is a small file that redirects to the actual executable of an installed program. They are automatically created in `C:\ProgramData\chocolatey\bin`.
Benefits of shims:
- Makes commands available immediately in any terminal
- Allows running programs without knowing their exact installation path
- Enables seamless updates without changing PATH variables
Example: When you install Terraform via Chocolatey, it creates a shim that allows you to run terraform from any location, while the actual executable might be in C:\ProgramData\chocolatey\lib\terraform\tools\.