# Prüft die search.json auf Validität und zeigt Basis-Metadaten
$path = Join-Path $PSScriptRoot '..\search.json' | Resolve-Path -ErrorAction Stop
try {
    $raw = Get-Content -Raw -Path $path
    $data = ConvertFrom-Json -InputObject $raw
} catch {
    Write-Output "PARSE: FAILED"
    Write-Output $_.Exception.Message
    exit 1
}
if (-not ($data -is [System.Collections.IEnumerable])) {
    Write-Output "PARSE: OK (single object)"
    $count = 1
    $first = $data
} else {
    Write-Output "PARSE: OK"
    $count = $data.Count
    $first = $data[0]
}
Write-Output "COUNT:$count"
$keys = ($first | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name) -join ','
Write-Output "KEYS:$keys"
# Zeige Vorschau der ersten Felder
if ($first -ne $null) {
    if ($first.PSObject.Properties.Name -contains 'title') { Write-Output "title: $($first.title)" }
    if ($first.PSObject.Properties.Name -contains 'url') { Write-Output "url: $($first.url)" }
}
Write-Output "OK"
