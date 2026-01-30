
$path = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
# ReadAllLines detects encoding automatically
$lines = [System.IO.File]::ReadAllLines($path)
# WriteAllLines defaults to UTF-8 without BOM in standard .NET methods often, 
# or we can force it:
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllLines($path, $lines, $utf8NoBom)
Write-Host "BOM stripped."
