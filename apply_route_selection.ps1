$file = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$content = Get-Content $file -Raw

# Modification 1: Add route selection reset after clearAllRoutes()
$content = $content -replace '(clearAllRoutes\(\);)', "`$1`r`n`r`n            // Reset route selection`r`n            selectedRouteIndex = 0;`r`n            allRoutes.clear();"

# Modification 2: Add route storage after drawSingleRoute
$content = $content -replace '(drawSingleRoute\(routePoints, sourceId, routeId, color, width\);)', "`$1`r`n`r`n                    // Store route data for selection`r`n                    RouteData routeData = new RouteData(routePoints, distance, duration, sourceId, routeId, color);`r`n                    allRoutes.add(routeData);"

# Modification 3: Add selectRoute call in click listener
$content = $content -replace '(cardView\.setOnClickListener\(v -> \{)', "`$1`r`n        // Select this route`r`n        selectRoute(index);"

# Save the modified content
Set-Content $file $content -NoNewline

Write-Host "Route selection code modifications applied successfully!"
