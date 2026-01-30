$file = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$content = Get-Content $file -Raw
$insertCode = Get-Content "e:\proj01Mapbox\route_methods_insert.txt" -Raw

# Insert route selection methods before transport mode methods
$content = $content -replace '(    // ========== TRANSPORT MODE METHODS ==========)', "$insertCode`r`n"

# Save
Set-Content $file $content -NoNewline

Write-Host "Route selection methods inserted successfully!"
