---
layout: post
title: "Resolving Windows Line Endings (CRLF) Issues in Shell Scripts"
date: 2025-05-25
categories: blog linux
tags: Linux grep
---
This note outlines three quick methods—using dos2unix, sed, or an editor conversion—to ensure the script runs without errors.

When you run a shell script on a Unix-like system and see an error like:
```
zsh: ./script.sh: bad interpreter: /bin/bash^M: no such file or directory
```
this indicates that your script was saved with Windows line endings (CRLF) instead of Unix line endings (LF). The extra ^M character causes the interpreter path to be misread.

Why It Happens

- Windows vs. Unix: Windows uses CRLF (\r\n) for line breaks, while Unix-like systems use LF (\n).
- Impact on Scripts: The extra carriage return (\r) is appended to the shebang line (e.g., /bin/bash^M), causing the system to fail in locating the correct interpreter.

How to Fix It


1. Using dos2unix

If you have dos2unix installed, simply run:
```
dos2unix script.sh
```
This command converts the file to Unix line endings.

2. Using sed

You can also remove carriage returns using sed:
```
sed -i 's/\r$//' script.sh
```
This command edits the file in place, removing the \r at the end of each line.

3. Using a Text Editor

Open the script in an editor that supports different line endings (e.g., VS Code, Sublime Text, or Notepad++), and convert the file format to Unix (LF). Save the file afterwards.

---
By ensuring your shell scripts use Unix line endings, you can avoid interpreter errors and ensure smooth execution across different environments.