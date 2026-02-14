---
layout: post
title: "PowerShell and SQLite: Managing Data Efficiently"
date: 2026-02-14
categories: Scripting
tags: Powershell SQLite database
---
SQLite is a lightweight, file-based database that requires no server. Combined with PowerShell, it allows you to manage data quickly and easily – ideal for local projects, automation, or small datasets.

### **Prerequisites**

SQLite must be available on your system. Install it e.g. via Chocolatey:

```powershell
choco install sqlite
```

Alternatively, you can download `sqlite3.exe` directly from [sqlite.org](https://www.sqlite.org/download.html) and add it to your PATH.

### **Create a Database and Table**

```powershell
$DbPath = "C:\temp\books.db"

# Create database and table
sqlite3 $DbPath "CREATE TABLE IF NOT EXISTS books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    read INTEGER DEFAULT 0
);"
```

### **Insert Data**

```powershell
sqlite3 $DbPath "INSERT INTO books (title, author, read) VALUES ('Friends, Lovers and the Big Terrible Thing', 'Matthew Perry', 1);"
sqlite3 $DbPath "INSERT INTO books (title, author, read) VALUES ('C# in Depth', 'Jon Skeet', 0);"
```

### **Query Data**

```powershell
# List all books
sqlite3 -header -column $DbPath "SELECT * FROM books;"
```

Output:

```
id  title                                          author          read
--  ---------------------------------------------  --------------  ----
1   Friends, Lovers and the Big Terrible Thing     Matthew Perry   1
2   C# in Depth                                    Jon Skeet       0
```

### **Processing Query Results in PowerShell**

The output of `sqlite3` can be directly converted into PowerShell variables:

```powershell
# Use CSV mode for easy parsing
$Results = sqlite3 -csv -header $DbPath "SELECT title, author FROM books WHERE read = 0;"
$Books = $Results | ConvertFrom-Csv

foreach ($Book in $Books) {
    Write-Host "Not yet read: $($Book.title) by $($Book.author)"
}
```

### **Update and Delete Data**

```powershell
# Mark book as read
sqlite3 $DbPath "UPDATE books SET read = 1 WHERE title = 'C# in Depth';"

# Delete an entry
sqlite3 $DbPath "DELETE FROM books WHERE id = 2;"
```

### **Helper Function for Repeated Queries**

To simplify repeated calls, a small wrapper function comes in handy:

```powershell
function Invoke-Sqlite {
    param(
        [string]$Database,
        [string]$Query
    )
    $Output = sqlite3 -csv -header $Database $Query
    if ($Output) {
        return $Output | ConvertFrom-Csv
    }
}

# Usage
$AllBooks = Invoke-Sqlite -Database $DbPath -Query "SELECT * FROM books;"
$AllBooks | Format-Table
```