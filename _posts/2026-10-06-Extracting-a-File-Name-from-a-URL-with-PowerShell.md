---
layout: post
title: "Extracting a File Name from a URL with PowerShell"
date: 2026-10-06
categories: Scripting
tags: Powershell URL dotnet
---
If a URL points to a file, you may want to extract its name for use in a script. Query parameters and fragments can make simple string splitting inconvenient. PowerShell's `[uri]` type gives you access to the individual parts of a URL.

### **Create a URI Object**

Assign the URL to a variable typed as `[uri]`:

```powershell
[uri]$Uri = 'https://some-server.com/Path/To/File.txt?someQueryParameter=123#Heading1'
```

PowerShell converts the string into a `System.Uri` object. This lets you inspect the host, path, query, and fragment separately, without contacting the server.

### **Inspect the URL Components**

Display the properties relevant to this example:

```powershell
$Uri | Select-Object AbsolutePath, AbsoluteUri, PathAndQuery,
    Segments, Host, Port, Query, Fragment, Scheme | Format-List
```

Output (line wrapping depends on the console width):

```text
AbsolutePath : /Path/To/File.txt
AbsoluteUri  : https://some-server.com/Path/To/File.txt?someQueryParameter=123#Heading1
PathAndQuery : /Path/To/File.txt?someQueryParameter=123
Segments     : {/, Path/, To/, File.txt}
Host         : some-server.com
Port         : 443
Query        : ?someQueryParameter=123
Fragment     : #Heading1
Scheme       : https
```

`AbsolutePath` contains only the path. The query parameter and fragment are available through `Query` and `Fragment`, so they do not become part of the file name.

### **Extract the File Name**

Use `Split-Path` with `-Leaf` to get the final component of the path:

```powershell
$FileName = Split-Path -Path $Uri.AbsolutePath -Leaf
$FileName
```

Output:

```text
File.txt
```

This extracts the name from the URL path; it does not check whether the file exists or determine a file name supplied by the server in a download response. Use it when the URL path itself contains the file name you need.

### **More Information**

- [System.Uri class](https://learn.microsoft.com/en-us/dotnet/api/system.uri)
- [Split-Path cmdlet](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/split-path)
