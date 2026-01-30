
$file = "e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java"
$content = Get-Content $file -Raw

# 1. Replace simple Toasts: Toast.makeText(this, "Message", Toast.LENGTH_SHORT).show();
# We capture the message text (group 1)
$content = $content -replace 'Toast\.makeText\([^,]+,\s*"([^"]+)",\s*Toast\.LENGTH_[A-Z]+\)\.show\(\);', 'showNotification("$1");'

# 2. Replace Concatenated Toasts: Toast.makeText(this, "Message " + var, Toast.LENGTH_SHORT).show();
# This captures "Message " + var
$content = $content -replace 'Toast\.makeText\([^,]+,\s*("[^"]+"\s*\+\s*[^,]+),\s*Toast\.LENGTH_[A-Z]+\)\.show\(\);', 'showNotification($1);'

# 3. Replace Variable + String Toasts: Toast.makeText(this, var + " Message", Toast.LENGTH_SHORT).show();
# This captures var + " Message"
$content = $content -replace 'Toast\.makeText\([^,]+,\s*([^,]+\s*\+\s*"[^"]+"),\s*Toast\.LENGTH_[A-Z]+\)\.show\(\);', 'showNotification($1);'

# 4. Replace Just Variable Toasts: Toast.makeText(this, e.getMessage(), ...).show();
$content = $content -replace 'Toast\.makeText\([^,]+,\s*([^,]+),\s*Toast\.LENGTH_[A-Z]+\)\.show\(\);', 'showNotification($1);'

# 5. Generic cleanup of wrapped runOnUiThread if it becomes redundant (optional, skipping to be safe)

# Write back with strict UTF-8 No BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($file, $content, $utf8NoBom)

Write-Host "Toasts migrated successfully."
