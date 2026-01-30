$file = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$content = Get-Content $file -Raw

# Remove duplicate transport mode methods (keep only the first occurrence)
# Find the second occurrence of setTransportMode and remove it along with the other duplicates
$pattern = '(?s)(// ========== TRANSPORT MODE METHODS ==========.*?private String getModeDisplayName.*?}\s*})\s*\1'
$content = $content -replace $pattern, '$1'

# Save
Set-Content $file $content -NoNewline

Write-Host "Removed duplicate methods!"
