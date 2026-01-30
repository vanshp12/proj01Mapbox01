
$file = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$lines = Get-Content $file
$newLines = @()

foreach ($line in $lines) {
    if ($line -match 'Toast\.makeText\(this, .*Calculating route.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
        $newLines += '        showNotification("🔄 Calculating route...");'
    }
    elseif ($line -match 'Toast\.makeText\(this, .*Location not found yet.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
        $newLines += '                showNotification("⚠️ Location not found yet. Checking GPS...");'
    }
    elseif ($line -match 'Toast\.makeText\(this, .*Please enter both locations.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
        $newLines += '                showNotification("⚠️ Please enter both locations");'
    }
    elseif ($line -match 'Toast\.makeText\(this, .*Please search for a route first.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
        $newLines += '                showNotification("⚠️ Please search for a route first");'
    }
    elseif ($line -match 'Toast\.makeText\(this, .*Voice Muted.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
        $newLines += '                showNotification(!isMuted ? "Voice Muted" : "Voice Unmuted");'
    }
    elseif ($line -match 'Toast\.makeText\(this, .*Profile clicked.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
        $newLines += '                showNotification("Profile clicked");'
    }
    elseif ($line -match 'Toast\.makeText\(this, .*Timeline clicked.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
        $newLines += '                showNotification("Timeline clicked");'
    }
    elseif ($line -match 'Toast\.makeText\(this, .*Transit Layer Toggled.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
        $newLines += '                showNotification("Transit Layer Toggled");'
    }
    elseif ($line -match 'Toast\.makeText\(this, .*Add Place clicked.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
        $newLines += '                showNotification("Add Place clicked");'
    }
    elseif ($line -match 'Toast\.makeText\(this, .*Share Location clicked.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
        $newLines += '                showNotification("Share Location clicked");'
    }
    elseif ($line -match 'Toast\.makeText\(this, .*Settings clicked.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
        $newLines += '                showNotification("Settings clicked");'
    }
    elseif ($line -match 'Toast\.makeText\(this, .*Help clicked.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
        $newLines += '                showNotification("Help clicked");'
    }
    elseif ($line -match 'Toast\.makeText\(this, .*Route calculation failed.*, Toast\.LENGTH_SHORT\)\.show\(\);') {
         $newLines += '            runOnUiThread(() -> showNotification("❌ Route calculation failed"));'
    }
    else {
        $newLines += $line
    }
}

$newLines | Set-Content $file -Encoding UTF8
Write-Host "Notifications fixed."
