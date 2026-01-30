# 🚀 Quick Setup Guide - DriveRoute Pro

## ⚡ 5-Minute Setup

### Step 1: Get Mapbox Tokens (2 minutes)

1. **Sign up:** [https://account.mapbox.com/auth/signup/](https://account.mapbox.com/auth/signup/)

2. **Get Public Token:**
   - Go to: [https://account.mapbox.com/access-tokens/](https://account.mapbox.com/access-tokens/)
   - Copy your **Default Public Token** (starts with `pk.`)

3. **Create Secret Token:**
   - Click **"Create a token"**
   - Name: `DriveRoute Downloads`
   - Check scope: **DOWNLOADS:READ**
   - Click **"Create token"**
   - Copy the token (starts with `sk.`) - **Save it immediately!**

### Step 2: Configure Tokens (1 minute)

#### A. Add Secret Token

**File:** `gradle.properties` (line 26)

```properties
MAPBOX_DOWNLOADS_TOKEN=sk.ey...PASTE_YOUR_SECRET_TOKEN_HERE
```

#### B. Add Public Token

**File:** `app/src/main/res/values/strings.xml` (line 6)

```xml
<string name="mapbox_access_token">pk.ey...PASTE_YOUR_PUBLIC_TOKEN_HERE</string>
```

### Step 3: Sync & Run (2 minutes)

1. **Sync Gradle:**
   - Click **"Sync Now"** in Android Studio
   - Wait for dependencies to download (~1-2 minutes)

2. **Run App:**
   - Click **Run** ▶️
   - Select device/emulator
   - Grant location permission when prompted

### ✅ Done!

Your app should now display a map with your current location!

---

## 🎯 Quick Feature Test

### Test Route Planning:
1. Source: `San Francisco Airport`
2. Destination: `Golden Gate Bridge`
3. Click **FIND ROUTE**
4. See multiple routes displayed

### Test POI Discovery:
1. Click **GAS STATIONS**
2. See red markers appear
3. Tap any marker
4. View details in BottomSheet

---

## ⚠️ Common Issues

| Problem | Solution |
|---------|----------|
| Gradle sync fails | Verify Secret Token in `gradle.properties` |
| Map doesn't load | Check Public Token in `strings.xml` |
| No location shown | Grant location permission |
| Routes fail | Check internet connection |

---

## 📋 Checklist

- [ ] Mapbox account created
- [ ] Public Token copied
- [ ] Secret Token created & copied
- [ ] Secret Token added to `gradle.properties`
- [ ] Public Token added to `strings.xml`
- [ ] Gradle synced successfully
- [ ] App runs on device
- [ ] Location permission granted
- [ ] Map loads with current location
- [ ] Route planning works
- [ ] POI search works

---

**Need help?** Check the full `README.md` for detailed troubleshooting.
