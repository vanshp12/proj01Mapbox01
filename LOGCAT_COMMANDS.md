# 📱 DriveRoute Pro - Logcat Commands Reference

## 🚀 Quick Start - Run the App

```powershell
# Launch the app
adb shell am start -n com.example.proj01mapbox/.MainActivity

# Force stop the app
adb shell am force-stop com.example.proj01mapbox

# Restart the app (force stop + launch)
adb shell am force-stop com.example.proj01mapbox && adb shell am start -n com.example.proj01mapbox/.MainActivity
```

---

## 📊 Logcat Commands

### 1. **View App Logs (Filtered)**
```powershell
# View only DriveRoute Pro logs
adb logcat -s DriveRoutePro:*

# View MainActivity logs
adb logcat -s MainActivity:*

# View ActiveNavigation logs
adb logcat -s ActiveNavigation:*

# View all app-related logs
adb logcat -s DriveRoutePro:* MainActivity:* ActiveNavigation:*
```

### 2. **View Errors Only**
```powershell
# View all errors
adb logcat *:E

# View app errors
adb logcat -s DriveRoutePro:E MainActivity:E ActiveNavigation:E

# View crashes (AndroidRuntime)
adb logcat -s AndroidRuntime:E
```

### 3. **Clear Logs**
```powershell
# Clear all logs
adb logcat -c

# Then start viewing fresh logs
adb logcat -s DriveRoutePro:*
```

### 4. **Save Logs to File**
```powershell
# Save all logs to file
adb logcat > logs.txt

# Save app logs to file
adb logcat -s DriveRoutePro:* MainActivity:* > app_logs.txt

# Save errors to file
adb logcat *:E > errors.txt
```

### 5. **Live Monitoring (Recommended)**
```powershell
# Clear logs and monitor in real-time
adb logcat -c && adb logcat -s DriveRoutePro:* MainActivity:* ActiveNavigation:*

# Monitor with timestamps
adb logcat -v time -s DriveRoutePro:*

# Monitor with colors (if supported)
adb logcat -v color -s DriveRoutePro:*
```

### 6. **Search Logs**
```powershell
# Search for specific text
adb logcat | Select-String "route"

# Search for errors
adb logcat | Select-String "error|exception|crash" -CaseSensitive:$false

# Search in saved logs
Get-Content logs.txt | Select-String "Start button"
```

### 7. **View Last N Lines**
```powershell
# View last 100 lines
adb logcat -t 100

# View last 50 app logs
adb logcat -t 50 -s DriveRoutePro:*

# View recent logs and continue monitoring
adb logcat -t 100 -s DriveRoutePro:* MainActivity:*
```

---

## 🎯 Specific Use Cases

### **Test Start Button (After Crash Fix)**
```powershell
# 1. Clear logs
adb logcat -c

# 2. Monitor logs
adb logcat -s DriveRoutePro:* ActiveNavigation:*

# 3. In app: Search route → Click Start
# 4. Look for these logs:
#    - "Start button clicked"
#    - "Route JSON received from RouteDataHolder"
#    - "Navigation started successfully"
```

### **Debug Route Search**
```powershell
# Monitor route calculation
adb logcat -s DriveRoutePro:* | Select-String "route|geocode|calculate"
```

### **Check for Crashes**
```powershell
# Monitor for crashes
adb logcat -s AndroidRuntime:E

# If crash occurs, save full log
adb logcat -d > crash_log.txt
```

### **Monitor GPS/Location**
```powershell
# Monitor location updates
adb logcat -s DriveRoutePro:* | Select-String "location|gps|latitude|longitude"
```

---

## 🔍 Log Levels

```
V - Verbose (lowest priority)
D - Debug
I - Info
W - Warning
E - Error
F - Fatal
S - Silent (highest priority, suppress all)
```

### **Examples:**
```powershell
# Only Debug and above
adb logcat DriveRoutePro:D *:S

# Only Warnings and Errors
adb logcat DriveRoutePro:W *:S

# Everything from app
adb logcat DriveRoutePro:V *:S
```

---

## 📝 Common Patterns

### **Pattern 1: Quick Debug Session**
```powershell
# Clear, run app, monitor
adb logcat -c
adb shell am start -n com.example.proj01mapbox/.MainActivity
adb logcat -s DriveRoutePro:* MainActivity:*
```

### **Pattern 2: Capture Crash**
```powershell
# Clear logs
adb logcat -c

# Reproduce crash in app

# Save crash log
adb logcat -d > crash_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt
```

### **Pattern 3: Monitor Specific Feature**
```powershell
# Test Start button
adb logcat -c
# Click Start in app
adb logcat -d | Select-String "Start button|RouteDataHolder|ActiveNavigation"
```

---

## 🎨 Formatted Output

### **With Timestamps:**
```powershell
adb logcat -v time -s DriveRoutePro:*
```

### **With Thread Info:**
```powershell
adb logcat -v threadtime -s DriveRoutePro:*
```

### **Detailed Format:**
```powershell
adb logcat -v long -s DriveRoutePro:*
```

---

## 🚨 Troubleshooting

### **No Logs Appearing?**
```powershell
# Check if device is connected
adb devices

# Check if app is running
adb shell ps | Select-String "proj01mapbox"

# Try without filter
adb logcat | Select-String "proj01mapbox"
```

### **Too Many Logs?**
```powershell
# Use specific tags only
adb logcat -s DriveRoutePro:D *:S

# Limit output
adb logcat -s DriveRoutePro:* | Select-Object -First 50
```

### **Save and Analyze Later:**
```powershell
# Save 5 minutes of logs
adb logcat -s DriveRoutePro:* > logs.txt
# Press Ctrl+C after 5 minutes

# Analyze
Get-Content logs.txt | Select-String "error"
```

---

## 📊 Real-Time Monitoring Setup

### **PowerShell Script:**
```powershell
# monitor-app.ps1
Write-Host "🔍 Monitoring DriveRoute Pro..." -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
Write-Host ""

adb logcat -c
adb logcat -v time -s DriveRoutePro:* MainActivity:* ActiveNavigation:* | 
    ForEach-Object {
        if ($_ -match "error|exception|crash") {
            Write-Host $_ -ForegroundColor Red
        } elseif ($_ -match "success|complete") {
            Write-Host $_ -ForegroundColor Green
        } else {
            Write-Host $_
        }
    }
```

**Usage:**
```powershell
.\monitor-app.ps1
```

---

## 🎯 Quick Reference Card

| Task | Command |
|------|---------|
| **Run App** | `adb shell am start -n com.example.proj01mapbox/.MainActivity` |
| **View Logs** | `adb logcat -s DriveRoutePro:*` |
| **Clear Logs** | `adb logcat -c` |
| **View Errors** | `adb logcat *:E` |
| **Save Logs** | `adb logcat > logs.txt` |
| **Search Logs** | `adb logcat \| Select-String "text"` |
| **Stop App** | `adb shell am force-stop com.example.proj01mapbox` |

---

## 💡 Pro Tips

1. **Always clear logs before testing:**
   ```powershell
   adb logcat -c
   ```

2. **Use timestamps for debugging:**
   ```powershell
   adb logcat -v time
   ```

3. **Save important logs immediately:**
   ```powershell
   adb logcat -d > important_$(Get-Date -Format 'HHmmss').txt
   ```

4. **Filter noise with specific tags:**
   ```powershell
   adb logcat -s DriveRoutePro:D *:S
   ```

5. **Search for patterns:**
   ```powershell
   adb logcat | Select-String "Start button|route|navigation"
   ```

---

**Happy Debugging! 🐛🔍**
