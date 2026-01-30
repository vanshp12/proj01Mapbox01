# Fix Script for DriveRoute Pro - Transaction Too Large Exception

Write-Host "🔧 Applying crash fix for Start button..." -ForegroundColor Cyan

# Fix 1: MainActivity.java - Start Button
Write-Host "`n📝 Fixing MainActivity.java - Start Button..." -ForegroundColor Yellow
$mainActivity = "app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$content = Get-Content $mainActivity -Raw

# Replace Start button to use RouteDataHolder
$content = $content -replace 'intent\.putExtra\("route_json", currentRouteJson\);(\s+)startActivity\(intent\);', 'RouteDataHolder.getInstance().setRouteData(currentRouteJson, binding.sourceInput.getText().toString(), binding.destinationInput.getText().toString());$1startActivity(intent);'

Set-Content $mainActivity $content
Write-Host "✅ MainActivity.java updated" -ForegroundColor Green

# Fix 2: ActiveNavigationActivity.java
Write-Host "`n📝 Fixing ActiveNavigationActivity.java..." -ForegroundColor Yellow
$activeNav = "app\src\main\java\com\example\proj01mapbox\ActiveNavigationActivity.java"
$content = Get-Content $activeNav -Raw

# Replace Intent extra with RouteDataHolder
$content = $content -replace 'String routeJson = getIntent\(\)\.getStringExtra\("route_json"\);', 'String routeJson = RouteDataHolder.getInstance().getRouteJson();'

Set-Content $activeNav $content
Write-Host "✅ ActiveNavigationActivity.java updated" -ForegroundColor Green

# Fix 3: RoutePreviewActivity.java
Write-Host "`n📝 Fixing RoutePreviewActivity.java..." -ForegroundColor Yellow
$previewAct = "app\src\main\java\com\example\proj01mapbox\RoutePreviewActivity.java"
if (Test-Path $previewAct) {
    $content = Get-Content $previewAct -Raw
    $content = $content -replace 'String routeJson = getIntent\(\)\.getStringExtra\("route_json"\);', 'String routeJson = RouteDataHolder.getInstance().getRouteJson();'
    Set-Content $previewAct $content
    Write-Host "✅ RoutePreviewActivity.java updated" -ForegroundColor Green
}

Write-Host "`n🎉 All fixes applied successfully!" -ForegroundColor Green
Write-Host "`n📦 Next steps:" -ForegroundColor Cyan
Write-Host "1. Open project in Android Studio"
Write-Host "2. Click 'Sync Project with Gradle Files'"
Write-Host "3. Build -> Rebuild Project"
Write-Host "4. Run on device"
Write-Host "`nOr use command line:"
Write-Host "  ./gradlew clean assembleDebug"
Write-Host "  adb install -r app\build\outputs\apk\debug\app-debug.apk"
