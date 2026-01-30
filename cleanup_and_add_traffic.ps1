$file = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$content = Get-Content $file -Raw

# Find and remove everything from the second "// ========== ROUTE SELECTION METHODS ==========" to the end
# Keep only up to the first set of methods and the final closing brace

# Split at the second occurrence of ROUTE SELECTION
$marker = "    // ========== ROUTE SELECTION METHODS =========="
$firstPart = $content.IndexOf($marker)
$secondPart = $content.IndexOf($marker, $firstPart + 1)

if ($secondPart -gt 0) {
    # Keep everything up to the second occurrence
    $newContent = $content.Substring(0, $secondPart)
    # Add traffic layer methods and closing brace
    $trafficMethods = Get-Content "e:\proj01Mapbox\traffic_layer_methods.txt" -Raw
    $newContent += $trafficMethods
    
    Set-Content $file $newContent -NoNewline
    Write-Host "Removed duplicates and added traffic methods!"
} else {
    Write-Host "No duplicates found"
}
