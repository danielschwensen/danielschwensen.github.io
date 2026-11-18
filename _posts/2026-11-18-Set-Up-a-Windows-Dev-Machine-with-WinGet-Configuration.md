---
layout: post
title: "Set Up a Windows Dev Machine with WinGet Configuration"
date: 2026-11-18
categories: blog OS
tags: Windows winget Powershell Git VSCode
---

When setting up a new Windows PC or VM, you can keep your development tools in a single YAML file and install them with `winget configure`. WinGet Configuration uses PowerShell Desired State Configuration (DSC) to check what is already in place and apply the changes it needs to reach the desired state.

This example installs 7-Zip, Git for Windows, and Visual Studio Code with Microsoft's PowerShell extension.

### **Check WinGet**

On Windows 11, use an up-to-date version of App Installer and open PowerShell under the account you use for development. Check that WinGet is available and supports the `configure` command.

```powershell
winget --version
winget configure --help
```

If `winget` is missing or `configure` is unavailable, install or update App Installer from the Microsoft Store.

### **Create the Configuration File**

Save the following as `dev-setup.winget`.

```yaml
# yaml-language-server: $schema=https://aka.ms/configuration-dsc-schema/0.2
properties:
  resources:
    - resource: Microsoft.WinGet.DSC/WinGetPackage
      directives:
        description: Install 7-Zip
        securityContext: elevated
      settings:
        id: 7zip.7zip
        source: winget
        ensure: Present

    - resource: Microsoft.WinGet.DSC/WinGetPackage
      directives:
        description: Install Git for Windows
      settings:
        id: Git.Git
        source: winget
        ensure: Present

    - resource: Microsoft.WinGet.DSC/WinGetPackage
      id: install-vscode
      directives:
        description: Install Visual Studio Code
      settings:
        id: Microsoft.VisualStudioCode
        source: winget
        ensure: Present

    - resource: Microsoft.VSCode.Dsc/VSCodeExtension
      dependsOn:
        - install-vscode
      directives:
        description: Install the Microsoft PowerShell extension
        allowPrerelease: true
      settings:
        name: ms-vscode.PowerShell
        exist: true

  configurationVersion: 0.2.0
```

- `Microsoft.WinGet.DSC/WinGetPackage` checks for each application and installs it if it is missing. `settings.id` is the WinGet package ID.
- `install-vscode` identifies the VS Code resource inside this file. The extension's `dependsOn` points to that resource so the editor is in place before the extension is installed.
- `allowPrerelease: true` lets WinGet load a prerelease version of the DSC module that manages VS Code extensions. The example requests the stable PowerShell extension.
- `securityContext: elevated` requests administrator privileges for the machine-wide 7-Zip installation. The extension is installed for the Windows account that runs the configuration.

### **Review and Apply the Configuration**

From the directory containing the file, display the resources and check which packages and modules the configuration will use.

```powershell
winget configure show -f .\dev-setup.winget
```

Apply the configuration. Review the prompt from WinGet and approve the Windows elevation prompt for 7-Zip when it appears.

```powershell
winget configure -f .\dev-setup.winget
```

You can run the same command again after fixing a failed installation. WinGet checks each resource and skips those that already match the requested state. This example leaves package versions unpinned, so a fresh machine can pick up newer versions from the WinGet source.

### **Verify the Installation**

Open a new PowerShell window so it picks up any PATH changes. Check the three packages and look for the PowerShell extension in VS Code's extension list.

```powershell
winget list --id 7zip.7zip --exact
winget list --id Git.Git --exact
winget list --id Microsoft.VisualStudioCode --exact

git --version
code --list-extensions | Select-String '^ms-vscode\.powershell$'
```

The last command should print `ms-vscode.powershell`. The extension adds editing and debugging support to VS Code. Install the PowerShell 7 runtime separately if you want to use it for those tasks.

### **More Information**

- [Windows Package Manager WinGet in a Nutshell]({% post_url 2022-05-29-Windows_Package_Manager_WinGet_in_a_Nutshell %})
- [How to Install Git on Windows]({% post_url 2023-12-03-Install_Git_Windows %})
- [WinGet configure command](https://learn.microsoft.com/en-us/windows/package-manager/winget/configure)
- [Microsoft's sample configuration with a VS Code extension](https://github.com/microsoft/winget-dsc/blob/main/samples/Configuration%20files/Learn%20tutorials/Python%203.13/learn_python.winget)
- [Microsoft PowerShell extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.powershell)
- [Install PowerShell 7 on Windows](https://learn.microsoft.com/en-us/powershell/scripting/install/install-powershell-on-windows)
