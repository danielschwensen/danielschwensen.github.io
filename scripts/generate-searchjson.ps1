# Generates a static search.json from the local _posts for Simple-Jekyll-Search
# Best practice: run this locally, inspect the output, commit and push the generated search.json
# Usage (PowerShell):
#   cd path\to\repo
#   pwsh .\scripts\generate-searchjson.ps1

$postsDir = Join-Path $PSScriptRoot "..\_posts" | Resolve-Path
$outFile = Join-Path $PSScriptRoot "..\search.json" | Resolve-Path

Write-Host "Reading posts from: $postsDir"
$posts = Get-ChildItem -Path $postsDir -File | Sort-Object Name -Descending

$result = @()
foreach ($post in $posts) {
    $text = Get-Content -Raw -Path $post.FullName -ErrorAction Stop

    # Extract front matter and body
    $m = [regex]::Match($text, '(?s)^---\s*(.*?)\s*---\s*(.*)$')
    if (-not $m.Success) {
        # No frontmatter: treat whole file as content
        $front = ""
        $body = $text
    } else {
        $front = $m.Groups[1].Value
        $body = $m.Groups[2].Value
    }

    # Simple parser for common frontmatter keys
    function Get-FmVal($fmText, $key) {
        # Build the regex pattern safely by escaping the key and concatenating strings
    $escapedKey = [regex]::Escape($key)
    $prefix = '(?m)^'
    $suffix = '\s*:\s*(?:"(?<q>.*?)"|''(?<s>.*?)''|(?<u>.*))$'
    $pattern = $prefix + $escapedKey + $suffix
    $re = [regex]::Match($fmText, $pattern)
        if ($re.Success) {
            return ($re.Groups['q'].Value + $re.Groups['s'].Value + $re.Groups['u'].Value).Trim()
        }
        return ""
    }

    $title = Get-FmVal $front 'title'
    if (-not $title) { $title = [System.IO.Path]::GetFileNameWithoutExtension($post.Name) }
    $date = Get-FmVal $front 'date'
    $tags = Get-FmVal $front 'tags'
    $category = Get-FmVal $front 'category'

    # Helper to clean fields: trim, remove surrounding quotes and collapse whitespace
    function Clean-Field($s) {
        if (-not $s) { return "" }
        $s = $s.Trim()
        # remove matching surrounding double quotes or single quotes
        if ($s.Length -ge 2) {
            if (($s.StartsWith('"') -and $s.EndsWith('"')) -or ($s.StartsWith("'") -and $s.EndsWith("'"))) {
                $s = $s.Substring(1, $s.Length - 2)
            }
        }
        # collapse multiple spaces
        $s = ($s -replace '\s{2,}', ' ')
        return $s.Trim()
    }

    $title = Clean-Field $title
    $date = Clean-Field $date
    $tags = Clean-Field $tags
    $category = Clean-Field $category

    # If tags are written as YAML list, try to capture simple list
    if (-not $tags -and $front -match '(?m)^tags\s*:\s*\n((?:\s*-.*\n)+)') {
        $listText = $matches[1] -split "\n" | ForEach-Object { ($_ -replace '^\s*-\s*','').Trim() } | Where-Object { $_ }
        $tags = ($listText -join ', ')
    }

    # Build URL: try to match existing pattern: use filename without extension with leading and trailing slash
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($post.Name)
    $url = "/$baseName/"

    # Clean body (strip excessive whitespace and remove Liquid tags)
    $content = $body -replace "\r\n", "\n"
    $content = $content -replace "\n{2,}", "\n\n"
    # remove common Jekyll/Liquid tags to avoid leaking template markers into the search index
    $content = $content -replace '\{\{.*?\}\}', ' '
    $content = $content -replace '\{\%.*?\%\}', ' '
    $content = $content.Trim()
    $content = Clean-Field $content

    $obj = [ordered]@{
        title = $title
        category = $category
        tags = $tags
        url = $url
        date = $date
        content = $content
    }
    $result += $obj
}

# Convert to JSON and write file
# Use -Depth 5 to be safe and ensure unicode is preserved
$json = $result | ConvertTo-Json -Depth 5 -Compress
Set-Content -Path $outFile -Value $json -Encoding UTF8
Write-Host "Wrote $($outFile) with $($result.Count) posts."
