
$file = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$content = Get-Content $file -Raw

# Replace simple Toasts (short/long)
# Regex handles: Toast.makeText(context, "message", duration).show();
# We capture the message content in group 1.
$content = $content -replace 'Toast\.makeText\([^,]+,\s*"([^"]+)",\s*Toast\.LENGTH_[A-Z]+\)\.show\(\);', 'showNotification("$1");'

# Replace Toasts with concatenation
# Regex handles: Toast.makeText(context, "message " + variable, duration).show();
# Note: This is trickier with regex limits, but we can catch common patterns.
$content = $content -replace 'Toast\.makeText\([^,]+,\s*"([^"]+)"\s*\+\s*([^,]+),\s*Toast\.LENGTH_[A-Z]+\)\.show\(\);', 'showNotification("$1" + $2);'

# Replace Toasts with variable + string
$content = $content -replace 'Toast\.makeText\([^,]+,\s*([^,]+)\s*\+\s*"([^"]+)",\s*Toast\.LENGTH_[A-Z]+\)\.show\(\);', 'showNotification($1 + "$2");'

# Replace Incognito specific one if it reverted (User edit 1360 showed manual fix, but let's be safe)
# $content = $content -replace 'Toast\.makeText.*Incognito.*', ... (Actually that was a Snackbar)

# Cleanup any "runOnUiThread(() -> showNotification" where the lambda might have been redundant but is fine/safe.
# Actually, showNotification MUST run on UI thread. If verify_file shows it inside runOnUiThread, that's good.

# Strip any remaining potential garbage char sequences that might be in the strings
# The user specified "ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â Ãƒâ€¦Ã¢â‚¬â„¢" and others.
# We will do a generic non-ASCII cleanup on the whole file to be sure, preserving basic punctuation.
# But being careful not to strip valid unicode if any (but app seems to be EN-only).
# Let's replace the specific sequences user hated.
$content = $content -replace 'ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â Ãƒâ€¦Ã¢â‚¬â„¢', ''
$content = $content -replace 'ÃƒÆ’Ã‚Â¢Ãƒâ€¦Ã‚Â¡Ãƒâ€šÃ‚Â ÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â', ''
$content = $content -replace 'ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â€šÂ¬Ã…â€œÃƒâ€šÃ‚Â', ''
$content = $content -replace 'ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â Ãƒâ€šÃ‚ÂºÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â', ''
$content = $content -replace 'ÃƒÆ’Ã‚Â¢Ãƒâ€¦Ã¢â‚¬Å“ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦', ''
$content = $content -replace 'ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂºÃƒÂ¢Ã¢â€šÂ¬Ã‹Å“', ''
$content = $content -replace 'ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢Ãƒâ€šÃ‚Â°', ''
$content = $content -replace 'ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â¢', '-' # Bullet point replacement

# Write back with strict UTF-8 No BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($file, $content, $utf8NoBom)

Write-Host "Toasts migrated and encoding garbage stripped."
