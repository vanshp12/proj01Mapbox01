
$file = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$content = Get-Content $file -Raw

# Replace "Location not found" line
# Matches: showNotification("... Location not found yet...");
$content = $content -replace 'showNotification\(".*Location not found yet.*"\);', 'showNotification("Location not found yet. Checking GPS...");'

# Replace "Please enter both locations" line
$content = $content -replace 'showNotification\(".*Please enter both locations.*"\);', 'showNotification("Please enter both locations");'

# Replace "Please search for a route first" line (Global replace for all instances)
$content = $content -replace 'showNotification\(".*Please search for a route first.*"\);', 'showNotification("Please search for a route first");'

# Replace Incognito Mode string literal (handles the multi-line Snackbar context)
# Matches: "GARBAGE Incognito Mode..."
$content = $content -replace '"[^"]*Incognito Mode Active - Location History Paused"', '"Incognito Mode Active - Location History Paused"'

# Write back with UTF8 encoding
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($file, $content, $utf8NoBom)

Write-Host "Notifications fixed via regex."
