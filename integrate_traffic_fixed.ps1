$file = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$content = Get-Content $file -Raw

# Add trafficLayerEnabled variable
$content = $content -replace '(private String transportMode = "driving"; // Default: car)', '$1' + "`r`n    private boolean trafficLayerEnabled = false; // Traffic layer state"

# Update nav_traffic handler - simpler approach
$oldHandler = 'Toast.makeText(this, "Traffic Layer Toggled", Toast.LENGTH_SHORT).show();'
$newHandler = 'toggleTrafficLayer();' + "`r`n            item.setChecked(trafficLayerEnabled);"
$content = $content -replace [regex]::Escape($oldHandler), $newHandler

# Save
Set-Content $file $content -NoNewline

Write-Host "Traffic layer integration complete!"
