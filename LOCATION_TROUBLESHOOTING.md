# 🔧 Current Location Troubleshooting Guide

## ⚠️ **ISSUE**: Unable to fetch current location and show route

---

## ✅ **APP INSTALLED**
```
✅ Installing APK 'app-debug.apk' on 'Pixel_8(AVD) - 16'
✅ Installed on 1 device.
✅ BUILD SUCCESSFUL in 8s
```

---

## 🎯 **QUICK FIXES**

### **1. Enable Location on Emulator** ⭐ MOST COMMON

#### **Method A: Set GPS Location in Emulator**
1. Open Android Emulator
2. Click **"..."** (Extended controls) on emulator sidebar
3. Go to **Location** tab
4. Set a location:
   - **Option 1**: Enter coordinates manually
     ```
     Latitude: 15.2993 (Goa)
     Longitude: 74.1240
     ```
   - **Option 2**: Search for a place (e.g., "Goa, India")
   - **Option 3**: Click on map
5. Click **"Send"** button
6. **Reopen the app**

#### **Method B: Enable GPS in Emulator Settings**
1. Open emulator
2. Go to **Settings** → **Location**
3. Turn **ON** "Use location"
4. Set **Location accuracy** to "High accuracy"
5. **Restart the app**

---

### **2. Grant Location Permission** ✅

#### **Check Permission**:
1. Open app
2. If permission dialog appears → Click **"Allow"**
3. If no dialog:
   - Go to **Settings** → **Apps** → **DriveRoute Pro**
   - **Permissions** → **Location**
   - Select **"Allow only while using the app"**

---

### **3. Test Current Location Feature** 📍

#### **Step-by-Step Test**:
```
1. Open app
2. Click 📍 button (next to source input)
3. Watch for toast messages:
   - "📍 Getting current location..."
   - "✅ Using current location"
4. Check source field: Should show "📍 Current Location"
5. Check map: Should center on location
```

---

## 🔍 **DEBUGGING STEPS**

### **Step 1: Check Logcat**
```bash
# In Android Studio
View → Tool Windows → Logcat

# Filter by tag
Tag: DriveRoutePro

# Look for messages:
"Auto-detected location: [lat], [lon]"
"Current location set: [lat], [lon]"
```

### **Step 2: Verify GPS is Working**
```
1. Open Google Maps on emulator
2. Click location button
3. If Maps shows location → GPS works
4. If not → GPS not enabled
```

### **Step 3: Check App Logs**
```
Look for these messages in Logcat:

✅ Success:
"Auto-detected location: 15.2993, 74.1240"
"Current location set: 15.2993, 74.1240"

❌ Error:
"Could not get last location"
"Location permission not granted"
"Error getting location"
```

---

## 🎯 **COMMON ISSUES & SOLUTIONS**

### **Issue 1: "Could not get last location"**

**Cause**: No GPS location set in emulator

**Solution**:
```
1. Open emulator extended controls (...)
2. Location tab
3. Set GPS coordinates
4. Click "Send"
5. Reopen app
```

---

### **Issue 2: "Location permission required"**

**Cause**: Permission not granted

**Solution**:
```
1. Settings → Apps → DriveRoute Pro
2. Permissions → Location
3. Select "Allow only while using the app"
4. Reopen app
```

---

### **Issue 3: Button doesn't work**

**Cause**: Button not clickable or app not updated

**Solution**:
```
1. Force stop app
2. Clear app data:
   Settings → Apps → DriveRoute Pro → Storage → Clear Data
3. Reopen app
4. Try again
```

---

### **Issue 4: Route not calculating**

**Cause**: Destination not set or API issue

**Solution**:
```
1. Make sure destination is entered
2. Click 📍 button
3. Wait for "🔍 Calculating route..." message
4. If no route appears:
   - Check internet connection
   - Check Mapbox API key is valid
```

---

## 📱 **MANUAL TESTING PROCEDURE**

### **Test 1: Basic Location Fetch**
```
1. Open app
2. Click 📍 button
3. Expected: Toast "📍 Getting current location..."
4. Expected: Toast "✅ Using current location"
5. Expected: Source shows "📍 Current Location"
6. Expected: Map centers on location
✅ PASS / ❌ FAIL
```

### **Test 2: Route Calculation**
```
1. Enter destination: "Delhi"
2. Click 📍 button
3. Expected: Toast "📍 Getting current location..."
4. Expected: Toast "✅ Using current location"
5. Expected: Toast "🔍 Calculating route..."
6. Expected: Route shown on map
✅ PASS / ❌ FAIL
```

### **Test 3: Permission Handling**
```
1. Deny location permission
2. Click 📍 button
3. Expected: Toast "⚠️ Location permission required"
4. Expected: Permission request dialog
✅ PASS / ❌ FAIL
```

---

## 🔧 **ADVANCED TROUBLESHOOTING**

### **If GPS Still Not Working**:

#### **Option 1: Use Mock Location**
```java
// In MainActivity.java, temporarily add:
private void testWithMockLocation() {
    // Goa, India coordinates
    currentLocation = Point.fromLngLat(74.1240, 15.2993);
    binding.sourceInput.setText("📍 Current Location (Test)");
    centerMap(currentLocation, 15.0);
    Toast.makeText(this, "✅ Using test location (Goa)", Toast.LENGTH_SHORT).show();
}

// Call this instead of useCurrentLocationAsSource() for testing
```

#### **Option 2: Set Default Location**
```java
// In autoDetectCurrentLocation(), change fallback:
if (location == null) {
    // Use Goa as default
    currentLocation = Point.fromLngLat(74.1240, 15.2993);
    binding.sourceInput.setText("📍 Goa, India (Default)");
    centerMap(currentLocation, 14.0);
    Toast.makeText(this, "📍 Using default location: Goa", Toast.LENGTH_SHORT).show();
}
```

---

## 📊 **EMULATOR GPS SETUP**

### **Recommended GPS Locations for Testing**:

```
Goa, India:
Latitude: 15.2993
Longitude: 74.1240

Mumbai, India:
Latitude: 19.0760
Longitude: 72.8777

Delhi, India:
Latitude: 28.6139
Longitude: 77.2090

Bangalore, India:
Latitude: 12.9716
Longitude: 77.5946
```

---

## ✅ **VERIFICATION CHECKLIST**

Before testing, verify:

- [ ] Emulator is running
- [ ] GPS location is set in emulator
- [ ] Location services enabled in emulator settings
- [ ] App has location permission
- [ ] Internet connection available
- [ ] Mapbox API key is valid
- [ ] App is latest version (just installed)

---

## 🎯 **EXPECTED BEHAVIOR**

### **When Everything Works**:

```
1. Click 📍 button
   ↓
2. Toast: "📍 Getting current location..."
   ↓
3. Toast: "✅ Using current location"
   ↓
4. Source field: "📍 Current Location"
   ↓
5. Map centers on your location
   ↓
6. If destination set:
   Toast: "🔍 Calculating route..."
   ↓
7. Route appears on map
   ↓
8. Done! ✅
```

---

## 🚀 **QUICK START GUIDE**

### **For Emulator Users**:

```
Step 1: Set GPS Location
1. Click "..." on emulator
2. Location tab
3. Search "Goa, India"
4. Click "Send"

Step 2: Grant Permission
1. Open app
2. Click "Allow" when asked

Step 3: Test Feature
1. Click 📍 button
2. Enter destination: "Delhi"
3. Watch route appear!
```

---

## 📝 **STILL NOT WORKING?**

### **Try This**:

1. **Restart Everything**:
   ```
   - Close app
   - Close emulator
   - Restart emulator
   - Reinstall app
   - Try again
   ```

2. **Use Physical Device**:
   ```
   - Connect Android phone via USB
   - Enable USB debugging
   - Install app on phone
   - Test with real GPS
   ```

3. **Check Logs**:
   ```
   adb logcat | grep "DriveRoutePro"
   ```

4. **Verify API Key**:
   ```
   - Check AndroidManifest.xml
   - Verify Mapbox token is valid
   - Test token on Mapbox website
   ```

---

## ✅ **SUMMARY**

### **Most Common Issues**:
1. ❌ GPS not set in emulator → Set location in extended controls
2. ❌ Permission not granted → Grant in app settings
3. ❌ App not updated → Reinstall app

### **Quick Fix**:
```
1. Set GPS in emulator (... → Location → Send)
2. Grant permission (Allow)
3. Click 📍 button
4. Done!
```

---

**Need more help? Check the logs and let me know what error you see!** 🔧
