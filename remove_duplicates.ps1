$file = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$content = Get-Content $file -Raw

# Find the position of the second "// ========== ROUTE SELECTION METHODS =========="
# and remove everything from there to the end, keeping only the final closing brace

# Split by the marker
$marker = "    // ========== ROUTE SELECTION METHODS =========="
$parts = $content -split [regex]::Escape($marker), 2

if ($parts.Length -eq 2) {
    # Keep the first part and just add the closing brace
    $newContent = $parts[0].TrimEnd() + "`r`n}`r`n"
    Set-Content $file $newContent -NoNewline
    Write-Host "Removed duplicate methods successfully!"
} else {
    Write-Host "Could not find duplicate marker"
}
