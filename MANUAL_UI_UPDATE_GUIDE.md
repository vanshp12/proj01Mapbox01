# 📝 Manual UI Update Guide - Exact Files to Edit

## 🎯 GOAL
Make the transport mode chips look like this:
```
┌──────────┐ ┌──────────┐ ┌──────────┐
│ 🚗 33 hr │ │ 🏍️ 36 hr │ │ 🚆 1 day │
└──────────┘ └──────────┘ └──────────┘
```
Instead of vertical (icon on top, text below).

---

## 📂 FILES TO EDIT

### **File 1: `activity_main.xml`**
**Location**: `app/src/main/res/layout/activity_main.xml`

**What to Find**: Search for `modeCarLayout` (around line 136)

**What to Change**:

#### **BEFORE** (Lines 136-164):
```xml
<LinearLayout
    android:id="@+id/modeCarLayout"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:orientation="vertical"          ← CHANGE THIS
    android:gravity="center"
    android:padding="8dp"                   ← CHANGE THIS
    android:layout_marginHorizontal="4dp"
    android:background="@android:drawable/btn_default"  ← CHANGE THIS
    android:clickable="true"
    android:focusable="true">

    <ImageView                              ← REMOVE THIS
        android:layout_width="24dp"
        android:layout_height="24dp"
        android:src="@android:drawable/ic_menu_directions"
        android:tint="#4285F4"
        android:contentDescription="Car" />

    <TextView
        android:id="@+id/carEtaText"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="33 hr"
        android:textSize="14sp"
        android:textStyle="bold"
        android:textColor="#000000"
        android:layout_marginTop="4dp" />    ← REMOVE THIS
</LinearLayout>
```

#### **AFTER** (Replace with):
```xml
<LinearLayout
    android:id="@+id/modeCarLayout"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:orientation="horizontal"        ← CHANGED
    android:gravity="center"
    android:paddingHorizontal="16dp"        ← CHANGED
    android:paddingVertical="10dp"          ← CHANGED
    android:layout_marginHorizontal="4dp"
    android:background="@drawable/bg_card_elevated"  ← CHANGED
    android:clickable="true"
    android:focusable="true">

    <TextView                               ← NEW (emoji)
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="🚗"
        android:textSize="18sp"
        android:layout_marginEnd="6dp" />

    <TextView
        android:id="@+id/carEtaText"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="33 hr"
        android:textSize="14sp"
        android:textStyle="bold"
        android:textColor="@color/text_primary"  ← CHANGED
        android:fontFamily="sans-serif-medium" />  ← NEW
</LinearLayout>
```

---

### **Repeat for Bike, Transit, and Walk**

#### **BIKE** (Lines 167-194):
```xml
<LinearLayout
    android:id="@+id/modeBikeLayout"
    android:orientation="horizontal"        ← CHANGE
    android:paddingHorizontal="16dp"        ← CHANGE
    android:paddingVertical="10dp"          ← CHANGE
    android:background="@drawable/bg_card_elevated">  ← CHANGE

    <TextView                               ← NEW
        android:text="🏍️"
        android:textSize="18sp"
        android:layout_marginEnd="6dp" />

    <TextView
        android:id="@+id/bikeEtaText"
        android:text="36 hr"
        android:textColor="@color/text_secondary" />  ← CHANGE
</LinearLayout>
```

#### **TRANSIT** (Lines 199-226):
```xml
<LinearLayout
    android:id="@+id/modeTransitLayout"
    android:orientation="horizontal"        ← CHANGE
    android:paddingHorizontal="16dp"        ← CHANGE
    android:paddingVertical="10dp"          ← CHANGE
    android:background="@drawable/bg_card_elevated">  ← CHANGE

    <TextView                               ← NEW
        android:text="🚆"
        android:textSize="18sp"
        android:layout_marginEnd="6dp" />

    <TextView
        android:id="@+id/transitEtaText"
        android:text="1 day"
        android:textColor="@color/text_secondary" />  ← CHANGE
</LinearLayout>
```

#### **WALK** (Lines 229-256):
```xml
<LinearLayout
    android:id="@+id/modeWalkLayout"
    android:orientation="horizontal"        ← CHANGE
    android:paddingHorizontal="16dp"        ← CHANGE
    android:paddingVertical="10dp"          ← CHANGE
    android:background="@drawable/bg_card_elevated">  ← CHANGE

    <TextView                               ← NEW
        android:text="🚶"
        android:textSize="18sp"
        android:layout_marginEnd="6dp" />

    <TextView
        android:id="@+id/walkEtaText"
        android:text="16 days"
        android:textColor="@color/text_secondary" />  ← CHANGE
</LinearLayout>
```

---

## 🎨 REQUIRED RESOURCES

### **File 2: `colors.xml`**
**Location**: `app/src/main/res/values/colors.xml`

**Add these if not present**:
```xml
<color name="text_primary">#202124</color>
<color name="text_secondary">#5F6368</color>
<color name="white">#FFFFFF</color>
```

---

### **File 3: `bg_card_elevated.xml`**
**Location**: `app/src/main/res/drawable/bg_card_elevated.xml`

**Create this file** (if it doesn't exist):
```xml
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android"
    android:shape="rectangle">
    <solid android:color="#FFFFFF" />
    <corners android:radius="16dp" />
    <stroke
        android:width="1dp"
        android:color="#EEEEEE" />
</shape>
```

---

## 📋 STEP-BY-STEP INSTRUCTIONS

### **Step 1: Open activity_main.xml**
1. In Android Studio, navigate to:
   ```
   app → src → main → res → layout → activity_main.xml
   ```

### **Step 2: Find modeCarLayout**
1. Press `Ctrl+F` (Find)
2. Search for: `modeCarLayout`
3. You should land on line ~136

### **Step 3: Edit Car Layout**
1. Change `android:orientation="vertical"` to `"horizontal"`
2. Change `android:padding="8dp"` to:
   ```xml
   android:paddingHorizontal="16dp"
   android:paddingVertical="10dp"
   ```
3. Change `android:background="@android:drawable/btn_default"` to:
   ```xml
   android:background="@drawable/bg_card_elevated"
   ```
4. **DELETE** the entire `<ImageView>` block (lines ~148-153)
5. **ADD** before `carEtaText`:
   ```xml
   <TextView
       android:layout_width="wrap_content"
       android:layout_height="wrap_content"
       android:text="🚗"
       android:textSize="18sp"
       android:layout_marginEnd="6dp" />
   ```
6. In `carEtaText`, change:
   - `android:textColor="#000000"` to `"@color/text_primary"`
   - **DELETE** `android:layout_marginTop="4dp"`
   - **ADD** `android:fontFamily="sans-serif-medium"`

### **Step 4: Repeat for Bike, Transit, Walk**
1. Find `modeBikeLayout` (line ~167)
2. Make the same changes, but use emoji `🏍️`
3. Find `modeTransitLayout` (line ~199)
4. Make the same changes, but use emoji `🚆`
5. Find `modeWalkLayout` (line ~229)
6. Make the same changes, but use emoji `🚶`

### **Step 5: Create bg_card_elevated.xml**
1. Right-click on `res/drawable` folder
2. New → Drawable Resource File
3. Name: `bg_card_elevated`
4. Paste the XML content from above

### **Step 6: Update colors.xml**
1. Open `res/values/colors.xml`
2. Add the color definitions if missing

### **Step 7: Build and Install**
1. In Android Studio: Build → Rebuild Project
2. Run → Run 'app'
3. Or use terminal:
   ```
   gradlew.bat installDebug
   ```

---

## ✅ VERIFICATION

After making these changes, you should see:

### **BEFORE**:
```
┌──┐
│🚗│
│33│
│hr│
└──┘
```

### **AFTER**:
```
┌──────────┐
│ 🚗 33 hr │
└──────────┘
```

---

## 🔧 TROUBLESHOOTING

### **If you get errors**:

1. **"Cannot resolve @color/text_primary"**
   - Add the color to `colors.xml`

2. **"Cannot resolve @drawable/bg_card_elevated"**
   - Create the drawable file

3. **Emojis not showing**
   - Make sure you're using UTF-8 encoding
   - Copy-paste the emojis directly: 🚗🏍️🚆🚶

4. **Layout looks broken**
   - Make sure you changed ALL four layouts (car, bike, transit, walk)
   - Check that you removed `layout_marginTop` from TextViews

---

## 📝 QUICK REFERENCE

### **Key Changes**:
| Property | Old Value | New Value |
|----------|-----------|-----------|
| orientation | vertical | horizontal |
| padding | 8dp | 16dp (H), 10dp (V) |
| background | btn_default | bg_card_elevated |
| Icon | ImageView | TextView (emoji) |
| textColor | #000000 | @color/text_primary |

---

## 🎯 EXPECTED RESULT

After these changes, your transport chips will look modern and horizontal like Google Maps!

**Good luck!** 🚀

If you need help with any step, just ask!
