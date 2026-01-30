$file = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$content = Get-Content $file -Raw

# Remove the old traffic layer methods (from "// ========== TRAFFIC LAYER METHODS ==========" to the end)
$marker = "    // ========== TRAFFIC LAYER METHODS =========="
$pos = $content.IndexOf($marker)

if ($pos -gt 0) {
    # Keep everything before the traffic marker
    $newContent = $content.Substring(0, $pos)
    # Add new simplified traffic methods
    $trafficMethods = Get-Content "e:\proj01Mapbox\traffic_layer_methods_simple.txt" -Raw
    $newContent += $trafficMethods
    
    Set-Content $file $newContent -NoNewline
    Write-Host "Replaced traffic methods with simplified version!"
} else {
    Write-Host "Traffic methods marker not found"
}
