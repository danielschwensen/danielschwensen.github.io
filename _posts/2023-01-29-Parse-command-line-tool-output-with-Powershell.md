---
layout: post
title: "Parse command line tool output with Powershell"
date: 2023-01-29
categories: Scripting
tags: Powershell
---

The other day, I had to restart a Windows server using only Powershell. The catch was that I had to do it only if the output of a command line tool was a certain way. I also kept a log for documentation purposes.

This script shows how easy it was.

```
$oascmd = "C:\path\to\oascmd.exe"
$output = & $oascmd

# Check if the output contains the string "alive"
if($output -match "alive") {
    Restart-Service -Name "Station_xl" -ErrorAction SilentlyContinue

    $time = Get-Date -Format "MM/dd/yyyy HH:mm:ss"
    $log = "$time - Service Station_xl stopped and started. Output: $output"
    Add-Content -Path "C:\path\to\logfile.txt" -Value $log
}
```

With this script, you can check the status of a service and restart it automatically if needed. This saves you time and effort.