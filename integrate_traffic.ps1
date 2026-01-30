$file = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$content = Get-Content $file -Raw

# Add trafficLayerEnabled variable after transportMode
$content = $content -replace '(private String transportMode = "driving"; // Default: car)', "`$1`r`n    private boolean trafficLayerEnabled = false; // Traffic layer state"

# Update nav_traffic handler
$content = $content -replace '(} else if \(id == R\.id\.nav_traffic\) \{[\r\n\s]+Toast\.makeText\(this, "Traffic Layer Toggled", Toast\.LENGTH_SHORT\)\.show\(\);)', '} else if (id == R.id.nav_traffic) {' + "`r`n            toggleTrafficLayer();`r`n            item.setChecked(trafficLayerEnabled);"

# Save
Set-Content $file $content -NoNewline

Write-Host "Traffic layer integration complete!"
