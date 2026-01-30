# 🔑 Mapbox Token Configuration Checklist

## Before You Start

⚠️ **IMPORTANT:** You need TWO different tokens from Mapbox:
1. **Public Token** (pk...) - Used in your app code
2. **Secret Token** (sk...) - Used for downloading Mapbox SDKs

---

## Step-by-Step Token Setup

### ✅ Step 1: Create Mapbox Account

- [ ] Go to: https://account.mapbox.com/auth/signup/
- [ ] Sign up with email or Google/GitHub
- [ ] Verify your email address
- [ ] Log in to your account

---

### ✅ Step 2: Get Public Token

- [ ] Navigate to: https://account.mapbox.com/access-tokens/
- [ ] Find **"Default public token"** in the list
- [ ] Click the **copy icon** next to the token
- [ ] Token should start with: `pk.ey...`
- [ ] Save it temporarily in a text file

**Example Public Token:**
```
pk.eyJ1IjoieW91cnVzZXJuYW1lIiwiYSI6ImNrZXhhbXBsZTEyMyJ9.example_signature_here
```

---

### ✅ Step 3: Create Secret Token

- [ ] On the same page, click **"Create a token"** button
- [ ] Enter token name: `DriveRoute Pro Downloads Token`
- [ ] Under **"Secret scopes"**, check: ✅ **DOWNLOADS:READ**
- [ ] Leave **"Public scopes"** unchecked
- [ ] Click **"Create token"** button
- [ ] **IMMEDIATELY** copy the token (you can only see it once!)
- [ ] Token should start with: `sk.ey...`
- [ ] Save it in a secure location

**Example Secret Token:**
```
sk.eyJ1IjoieW91cnVzZXJuYW1lIiwiYSI6ImNrZXhhbXBsZTQ1NiJ9.example_signature_here
```

⚠️ **WARNING:** You can only view the secret token ONCE. If you lose it, you'll need to create a new one.

---

### ✅ Step 4: Add Secret Token to gradle.properties

**File Location:** `proj01Mapbox/gradle.properties`

- [ ] Open `gradle.properties` in Android Studio
- [ ] Find line 26: `MAPBOX_DOWNLOADS_TOKEN=YOUR_SECRET_MAPBOX_TOKEN`
- [ ] Replace `YOUR_SECRET_MAPBOX_TOKEN` with your actual secret token
- [ ] Save the file

**Before:**
```properties
MAPBOX_DOWNLOADS_TOKEN=YOUR_SECRET_MAPBOX_TOKEN
```

**After:**
```properties
MAPBOX_DOWNLOADS_TOKEN=sk.eyJ1IjoieW91cnVzZXJuYW1lIiwiYSI6ImNrZXhhbXBsZTQ1NiJ9.example_signature_here
```

---

### ✅ Step 5: Add Public Token to strings.xml

**File Location:** `proj01Mapbox/app/src/main/res/values/strings.xml`

- [ ] Open `strings.xml` in Android Studio
- [ ] Find line 6: `<string name="mapbox_access_token">YOUR_PUBLIC_MAPBOX_TOKEN</string>`
- [ ] Replace `YOUR_PUBLIC_MAPBOX_TOKEN` with your actual public token
- [ ] Save the file

**Before:**
```xml
<string name="mapbox_access_token">YOUR_PUBLIC_MAPBOX_TOKEN</string>
```

**After:**
```xml
<string name="mapbox_access_token">pk.eyJ1IjoieW91cnVzZXJuYW1lIiwiYSI6ImNrZXhhbXBsZTEyMyJ9.example_signature_here</string>
```

---

### ✅ Step 6: Sync Gradle

- [ ] In Android Studio, click **"Sync Now"** (appears in top banner)
- [ ] Or go to: **File → Sync Project with Gradle Files**
- [ ] Wait for sync to complete (1-2 minutes)
- [ ] Check **"Build"** tab at bottom for any errors

**Expected Output:**
```
BUILD SUCCESSFUL in 1m 23s
```

---

### ✅ Step 7: Verify Configuration

- [ ] No Gradle sync errors
- [ ] Mapbox dependencies downloaded successfully
- [ ] Project builds without errors

---

## Verification Commands

### Check if tokens are configured:

**Windows PowerShell:**
```powershell
# Check gradle.properties
Select-String -Path "gradle.properties" -Pattern "MAPBOX_DOWNLOADS_TOKEN"

# Check strings.xml
Select-String -Path "app\src\main\res\values\strings.xml" -Pattern "mapbox_access_token"
```

---

## Common Mistakes

### ❌ Mistake 1: Using Public Token in gradle.properties
**Wrong:**
```properties
MAPBOX_DOWNLOADS_TOKEN=pk.ey...  # This is WRONG!
```
**Correct:**
```properties
MAPBOX_DOWNLOADS_TOKEN=sk.ey...  # Secret token starts with sk.
```

---

### ❌ Mistake 2: Using Secret Token in strings.xml
**Wrong:**
```xml
<string name="mapbox_access_token">sk.ey...</string>  <!-- This is WRONG! -->
```
**Correct:**
```xml
<string name="mapbox_access_token">pk.ey...</string>  <!-- Public token starts with pk. -->
```

---

### ❌ Mistake 3: Not creating Secret Token with DOWNLOADS:READ scope
**Solution:**
- Delete the token
- Create a new one
- Make sure to check **DOWNLOADS:READ** under Secret scopes

---

### ❌ Mistake 4: Forgetting to Sync Gradle
**Solution:**
- Always click **"Sync Now"** after changing gradle.properties
- Wait for sync to complete before building

---

## Troubleshooting

### Error: "Failed to resolve: com.mapbox.maps:android"

**Cause:** Secret token is missing or incorrect

**Solution:**
1. Verify Secret Token in `gradle.properties`
2. Ensure it starts with `sk.`
3. Ensure it has `DOWNLOADS:READ` scope
4. Sync Gradle again

---

### Error: "Map failed to load"

**Cause:** Public token is missing or incorrect

**Solution:**
1. Verify Public Token in `strings.xml`
2. Ensure it starts with `pk.`
3. Check internet connection
4. Rebuild and run app

---

### Error: "401 Unauthorized" in Logcat

**Cause:** Invalid or expired token

**Solution:**
1. Go to Mapbox dashboard
2. Check if token is still active
3. Create a new token if needed
4. Update configuration files

---

## Security Best Practices

### ✅ DO:
- Keep your Secret Token private
- Add `gradle.properties` to `.gitignore` (already done)
- Use environment variables in CI/CD
- Rotate tokens periodically

### ❌ DON'T:
- Commit Secret Token to Git
- Share Secret Token publicly
- Use the same token for multiple projects
- Hardcode tokens in Java files

---

## Final Checklist

Before running the app, verify:

- [ ] Mapbox account created and verified
- [ ] Public Token (pk...) copied
- [ ] Secret Token (sk...) created with DOWNLOADS:READ scope
- [ ] Secret Token added to `gradle.properties` (line 26)
- [ ] Public Token added to `strings.xml` (line 6)
- [ ] Gradle synced successfully
- [ ] No build errors
- [ ] Ready to run!

---

## Quick Reference

| Token Type | Starts With | Used In | Purpose |
|------------|-------------|---------|---------|
| **Public Token** | `pk.ey...` | `strings.xml` | Runtime API calls |
| **Secret Token** | `sk.ey...` | `gradle.properties` | Download SDKs |

---

## Need Help?

- **Mapbox Documentation:** https://docs.mapbox.com/android/
- **Token Management:** https://docs.mapbox.com/accounts/guides/tokens/
- **Support:** https://support.mapbox.com/

---

**Once all checkboxes are ✅, you're ready to build and run DriveRoute Pro!** 🚀
