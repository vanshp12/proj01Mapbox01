# 🎨 YatraSahayata - Icon & Splash Screen Implementation Guide

## Overview
This guide will help you implement the new YatraSahayata branding assets (app icon and splash screen) into your Android project.

---

## 📱 Step 1: Prepare App Icon Assets

### Option A: Using Android Studio Image Asset Studio (Recommended)

1. **Open Image Asset Studio**
   - In Android Studio, right-click on `app/res` folder
   - Select `New` → `Image Asset`

2. **Configure Launcher Icons**
   - **Icon Type**: Select "Launcher Icons (Adaptive and Legacy)"
   - **Name**: Keep as `ic_launcher`
   - **Asset Type**: Select "Image"
   - **Path**: Browse and select `yatrasahayata_app_icon_1768491099586.png`
   - **Trim**: Check "Yes" if needed
   - **Resize**: Adjust to 100%

3. **Configure Adaptive Icon**
   - **Foreground Layer**: Use the app icon
   - **Background Layer**: Use solid color `#FFFFFF` or gradient
   - **Preview**: Check all shapes (Circle, Square, Rounded Square, Squircle)

4. **Generate**
   - Click "Next" → "Finish"
   - This will automatically create icons for all densities:
     - `mipmap-mdpi/`
     - `mipmap-hdpi/`
     - `mipmap-xhdpi/`
     - `mipmap-xxhdpi/`
     - `mipmap-xxxhdpi/`

### Option B: Manual Icon Creation

If you prefer manual control, create these files:

```
app/src/main/res/
├── mipmap-mdpi/
│   └── ic_launcher.png (48x48px)
├── mipmap-hdpi/
│   └── ic_launcher.png (72x72px)
├── mipmap-xhdpi/
│   └── ic_launcher.png (96x96px)
├── mipmap-xxhdpi/
│   └── ic_launcher.png (144x144px)
├── mipmap-xxxhdpi/
│   └── ic_launcher.png (192x192px)
└── mipmap-anydpi-v26/
    ├── ic_launcher.xml
    └── ic_launcher_round.xml
```

---

## 🌅 Step 2: Implement Splash Screen

### For Android 12+ (API 31+)

1. **Create Splash Screen Theme**

Create/Edit `app/src/main/res/values/themes.xml`:

```xml
<resources>
    <!-- Splash Screen Theme (Android 12+) -->
    <style name="Theme.YatraSahayata.Splash" parent="Theme.SplashScreen">
        <item name="windowSplashScreenBackground">@color/splash_background</item>
        <item name="windowSplashScreenAnimatedIcon">@drawable/ic_launcher_foreground</item>
        <item name="windowSplashScreenAnimationDuration">1000</item>
        <item name="postSplashScreenTheme">@style/Theme.YatraSahayata</item>
    </style>
</resources>
```

2. **Add Splash Background Color**

Create/Edit `app/src/main/res/values/colors.xml`:

```xml
<resources>
    <!-- Splash Screen Colors -->
    <color name="splash_background">#FFFFFF</color>
    
    <!-- YatraSahayata Brand Colors -->
    <color name="saffron_orange">#FF9933</color>
    <color name="india_green">#138808</color>
    <color name="deep_blue">#1976D2</color>
    <color name="warm_gold">#FFA000</color>
</resources>
```

3. **Update AndroidManifest.xml**

```xml
<application
    android:icon="@mipmap/ic_launcher"
    android:roundIcon="@mipmap/ic_launcher_round"
    android:theme="@style/Theme.YatraSahayata">
    
    <activity
        android:name=".MainActivity"
        android:exported="true"
        android:theme="@style/Theme.YatraSahayata.Splash">
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
    </activity>
</application>
```

4. **Handle Splash in MainActivity**

Add to `MainActivity.java` in `onCreate()` before `setContentView()`:

```java
@Override
protected void onCreate(Bundle savedInstanceState) {
    // Handle splash screen transition
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        getSplashScreen().setOnExitAnimationListener(splashScreenView -> {
            // Create custom exit animation if needed
            ObjectAnimator.ofFloat(
                splashScreenView.getView(),
                View.ALPHA,
                1f,
                0f
            ).setDuration(500).start();
        });
    }
    
    super.onCreate(savedInstanceState);
    // ... rest of onCreate
}
```

### For Android 11 and Below (Legacy)

1. **Create Splash Drawable**

Create `app/src/main/res/drawable/splash_background.xml`:

```xml
<?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- Background gradient -->
    <item>
        <shape android:shape="rectangle">
            <gradient
                android:angle="90"
                android:startColor="#FF9933"
                android:centerColor="#FFFFFF"
                android:endColor="#138808"
                android:type="linear" />
        </shape>
    </item>
    
    <!-- App Icon -->
    <item>
        <bitmap
            android:gravity="center"
            android:src="@mipmap/ic_launcher" />
    </item>
</layer-list>
```

2. **Create Splash Theme**

Add to `themes.xml`:

```xml
<style name="SplashTheme" parent="Theme.AppCompat.NoActionBar">
    <item name="android:windowBackground">@drawable/splash_background</item>
    <item name="android:windowNoTitle">true</item>
    <item name="android:windowFullscreen">true</item>
</style>
```

3. **Create SplashActivity**

Create `app/src/main/java/com/example/proj01mapbox/SplashActivity.java`:

```java
package com.example.proj01mapbox;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import androidx.appcompat.app.AppCompatActivity;

public class SplashActivity extends AppCompatActivity {
    private static final int SPLASH_DURATION = 2000; // 2 seconds

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        new Handler().postDelayed(() -> {
            Intent intent = new Intent(SplashActivity.this, MainActivity.class);
            startActivity(intent);
            finish();
        }, SPLASH_DURATION);
    }
}
```

4. **Update AndroidManifest.xml**

```xml
<activity
    android:name=".SplashActivity"
    android:exported="true"
    android:theme="@style/SplashTheme">
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity>

<activity
    android:name=".MainActivity"
    android:exported="false" />
```

---

## 🎨 Step 3: Add Splash Screen Dependency (Android 12+)

Add to `app/build.gradle.kts`:

```kotlin
dependencies {
    // Splash Screen API
    implementation("androidx.core:core-splashscreen:1.0.1")
    
    // ... other dependencies
}
```

Sync Gradle after adding.

---

## 🔧 Step 4: Update App Name

Ensure `app/src/main/res/values/strings.xml` has:

```xml
<resources>
    <string name="app_name">YatraSahayata</string>
    <!-- ... other strings -->
</resources>
```

---

## 📝 Step 5: Verification Checklist

After implementation, verify:

### App Icon
- [ ] Icon appears correctly on home screen
- [ ] Icon looks good in all shapes (circle, square, rounded)
- [ ] Icon is clear at all sizes
- [ ] Round icon variant works properly
- [ ] Adaptive icon has proper foreground/background separation

### Splash Screen
- [ ] Splash screen appears on app launch
- [ ] Branding is clearly visible
- [ ] Transition to main activity is smooth
- [ ] No white flash or flicker
- [ ] Works on Android 12+ devices
- [ ] Works on older Android versions (if supporting legacy)

### General
- [ ] App name shows as "YatraSahayata" in launcher
- [ ] App name shows correctly in recent apps
- [ ] No build errors or warnings
- [ ] APK size is reasonable (icons optimized)

---

## 🎯 Quick Implementation (Copy-Paste Ready)

### 1. Copy Icon to Project
```bash
# From your downloads/artifacts folder, copy to project
cp yatrasahayata_app_icon_1768491099586.png app/src/main/res/drawable/app_icon.png
```

### 2. Use Android Studio Image Asset Studio
- Right-click `app/res` → New → Image Asset
- Select the icon file
- Generate all densities

### 3. Add Splash Screen Library
```kotlin
// In app/build.gradle.kts
implementation("androidx.core:core-splashscreen:1.0.1")
```

### 4. Create Splash Theme in themes.xml
```xml
<style name="Theme.YatraSahayata.Splash" parent="Theme.SplashScreen">
    <item name="windowSplashScreenBackground">#FFFFFF</item>
    <item name="windowSplashScreenAnimatedIcon">@mipmap/ic_launcher</item>
    <item name="postSplashScreenTheme">@style/Theme.YatraSahayata</item>
</style>
```

### 5. Update MainActivity Theme in AndroidManifest.xml
```xml
<activity
    android:name=".MainActivity"
    android:theme="@style/Theme.YatraSahayata.Splash">
```

### 6. Install Splash Screen in MainActivity.onCreate()
```java
// Add before super.onCreate()
installSplashScreen();
```

---

## 🐛 Troubleshooting

### Issue: Icon not updating
**Solution**: 
- Uninstall app completely from device
- Clean project: Build → Clean Project
- Rebuild: Build → Rebuild Project
- Reinstall app

### Issue: Splash screen white flash
**Solution**:
- Ensure `windowSplashScreenBackground` matches your theme background
- Use `windowSplashScreenAnimationDuration` to control timing

### Issue: Icon looks pixelated
**Solution**:
- Ensure you're using high-resolution source (1024x1024px)
- Regenerate icons using Image Asset Studio
- Check that xxxhdpi version is 192x192px

### Issue: Adaptive icon not working
**Solution**:
- Ensure you have `mipmap-anydpi-v26` folder
- Check `ic_launcher.xml` and `ic_launcher_round.xml` exist
- Verify foreground and background layers are defined

---

## 📚 Additional Resources

### Official Documentation
- [Android App Icons Guide](https://developer.android.com/guide/practices/ui_guidelines/icon_design_launcher)
- [Splash Screens (Android 12+)](https://developer.android.com/develop/ui/views/launch/splash-screen)
- [Adaptive Icons](https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive)

### Tools
- [Android Asset Studio](https://romannurik.github.io/AndroidAssetStudio/)
- [App Icon Generator](https://appicon.co/)
- [Adaptive Icon Playground](https://adapticon.tooo.io/)

---

## ✅ Final Steps

1. **Test on Multiple Devices**
   - Test on different Android versions
   - Test on different screen sizes
   - Test on different launcher apps

2. **Prepare for Play Store**
   - Create 512x512px high-res icon
   - Create feature graphic (1024x500px)
   - Take screenshots with new branding

3. **Update Documentation**
   - Update README with new screenshots
   - Update project documentation
   - Create release notes mentioning rebrand

---

**Implementation Status**: Ready to Deploy  
**Estimated Time**: 30-45 minutes  
**Difficulty**: Beginner to Intermediate  

**Last Updated**: January 15, 2026
