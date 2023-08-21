---
layout: post
title: "Cat A File With Line Numbers"
date: 2022-03-31
categories: blog tools
tags: Linux cat
---
You can use the <code>cat</code> command to view files, add line numbers with the '-n' flag and concatenate several files together. It's one of those simple tools that makes Linux so versatile.

Use <code>cat</code> to view a file.

```
daniel@CShark:/mnt/d$ cat index.html
<html lang="en">
<head>
<meta charset="utf-8" />
    <title>Hello World!</title>
    <link rel="stylesheet" href="hw.css">
</head>
<body>
<div class="mainBox">
    <div class="textBox">
        <h1>Hello World!</h1>
    </div>
    <img src="hw.jpeg" />
</div>
</body>
```
With the <code>-n</code> flag you can view that file with line numbers.

```
daniel@CShark:/mnt/d$ cat -n index.html
     1  <html lang="en">
     2  <head>
     3  <meta charset="utf-8" />
     4      <title>Hello World!</title>
     5      <link rel="stylesheet" href="hw.css">
     6  </head>
     7  <body>
     8  <div class="mainBox">
     9      <div class="textBox">
    10          <h1>Hello World!</h1>
    11      </div>
    12      <img src="hw.jpeg" />
    13  </div>
    14  </body>
```
Use <code>cat file1.txt file2.txt</code> if you want to view them as a single continuous file.

Use <code>cat file1.txt file2.txt > combined.txt</code> if you want to create a new file with both of them combined.