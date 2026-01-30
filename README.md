# YatraSahayata - Your Journey Assistant

A comprehensive Android navigation and route planning application built with **Mapbox SDK**. YatraSahayata (यात्रा सहायता) means "Journey Assistant" in Hindi - your complete travel companion for exploring India and beyond.

## 🚀 Features

### ✅ Implemented Features

1. **F-09: Map Setup**
   - MapView with Mapbox Streets style
   - Location permissions handling
   - User location puck (current position indicator)

2. **F-01: Search UI**
   - Source and Destination input fields
   - Mapbox Search SDK integration for geocoding
   - Modern Material Design UI

3. **F-02: Route Calculation**
   - Mapbox Navigation SDK integration
   - Route calculation between two points
   - Error handling and user feedback

4. **F-03: Multi-Route Visualization**
   - Multiple route alternatives (fast vs scenic)
   - Primary route in blue, alternatives in gray
   - Route polylines drawn on map

5. **F-05: POI Discovery**
   - Find nearby Gas Stations
   - Find nearby Cafes
   - Find nearby Hotels
   - Mapbox Search SDK for POI queries

6. **F-06: Custom POI Markers**
   - Color-coded markers (Red for gas stations, Orange for cafes, Purple for hotels)
   - Custom bitmap markers

7. **F-08: POI Details**
   - Click listener on POI markers
   - BottomSheet dialog showing place name, address, and category
   - Smooth user interaction

## 🛠️ Technology Stack

- **Language:** Java
- **IDE:** Android Studio (Latest)
- **Architecture:** MVVM-ready structure
- **Min SDK:** 24 (Android 7.0)
- **Target SDK:** 34

### Core SDKs

- **Mapbox Maps SDK v11** - Map display and visualization
- **Mapbox Search SDK v2** - Autocomplete and POI search
- **Mapbox Navigation SDK v3** - Route calculation and navigation
- **Google Play Services Location** - Device location services

## 📋 Prerequisites

Before you begin, ensure you have:

1. **Android Studio** (Latest version recommended)
2. **JDK 11** or higher
3. **Mapbox Account** - [Sign up here](https://account.mapbox.com/auth/signup/)

## 🔑 Getting Your Mapbox Tokens

### Step 1: Create a Mapbox Account
1. Go to [https://account.mapbox.com/auth/signup/](https://account.mapbox.com/auth/signup/)
2. Sign up for a free account

### Step 2: Get Your Public Token
1. Navigate to [https://account.mapbox.com/access-tokens/](https://account.mapbox.com/access-tokens/)
2. Copy your **Default Public Token** (starts with `pk.`)

### Step 3: Create a Secret Token
1. On the same page, click **"Create a token"**
2. Name it: `DriveRoute Pro Downloads Token`
3. Under **Secret scopes**, check: `DOWNLOADS:READ`
4. Click **"Create token"**
5. Copy the token (starts with `sk.`) - **You can only see this once!**

## ⚙️ Configuration Instructions

### 1. Add Your Secret Token (Downloads Token)

Open `gradle.properties` and replace `YOUR_SECRET_MAPBOX_TOKEN`:

```properties
# Mapbox Downloads Token (Secret Token)
MAPBOX_DOWNLOADS_TOKEN=sk.ey...YOUR_ACTUAL_SECRET_TOKEN
```

### 2. Add Your Public Token

Open `app/src/main/res/values/strings.xml` and replace `YOUR_PUBLIC_MAPBOX_TOKEN`:

```xml
<string name="mapbox_access_token">pk.ey...YOUR_ACTUAL_PUBLIC_TOKEN</string>
```

### 3. Sync Gradle

After adding both tokens:
1. Click **"Sync Now"** in Android Studio
2. Wait for Gradle sync to complete
3. Mapbox dependencies will be downloaded

## 🏗️ Project Structure

```
proj01Mapbox/
├── app/
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/example/proj01mapbox/
│   │   │   │   └── MainActivity.java          # Main activity with all features
│   │   │   ├── res/
│   │   │   │   ├── layout/
│   │   │   │   │   ├── activity_main.xml      # Main UI layout
│   │   │   │   │   └── bottom_sheet_poi_details.xml  # POI details sheet
│   │   │   │   └── values/
│   │   │   │       └── strings.xml            # App strings & tokens
│   │   │   └── AndroidManifest.xml            # Permissions & config
│   │   └── build.gradle.kts                   # App dependencies
│   └── gradle.properties                      # Secret token storage
└── settings.gradle.kts                        # Mapbox Maven repository
```

## 📦 Dependencies (Already Configured)

The following dependencies are already added in `app/build.gradle.kts`:

```kotlin
// Mapbox Maps SDK v11
implementation("com.mapbox.maps:android:11.0.0")

// Mapbox Search SDK
implementation("com.mapbox.search:mapbox-search-android:2.0.0")
implementation("com.mapbox.search:mapbox-search-android-ui:2.0.0")

// Mapbox Navigation SDK
implementation("com.mapbox.navigation:android:3.0.0")
implementation("com.mapbox.navigation:ui-maps:3.0.0")

// Location Services
implementation("com.google.android.gms:play-services-location:21.0.1")
```

## 🚦 Running the Application

### Step 1: Build the Project
```bash
# In Android Studio terminal or command line
./gradlew build
```

### Step 2: Run on Device/Emulator
1. Connect an Android device or start an emulator
2. Click **Run** (▶️) in Android Studio
3. Select your device
4. Wait for installation

### Step 3: Grant Permissions
When the app launches:
1. Allow **Location Permission** when prompted
2. The map will load with your current location

## 📱 How to Use

### 1. View Map
- The map loads automatically with Mapbox Streets style
- Your current location is shown with a blue puck
- Tap the **FAB (Floating Action Button)** to recenter on your location

### 2. Plan a Route
1. Enter **Source** location (e.g., "San Francisco Airport")
2. Enter **Destination** location (e.g., "Golden Gate Bridge")
3. Tap **"FIND ROUTE"**
4. Multiple route alternatives will be displayed
5. Primary route in **blue**, alternatives in **gray**
6. Tap **"CLEAR ROUTE"** to remove routes

### 3. Find Nearby POIs
1. Tap one of the POI buttons:
   - **GAS STATIONS** (Red markers)
   - **CAFES** (Orange markers)
   - **HOTELS** (Purple markers)
2. Up to 10 nearby locations will be shown
3. Tap any marker to see details in a BottomSheet

### 4. View POI Details
- Tap any POI marker
- A BottomSheet appears with:
  - Place name
  - Category (with emoji)
  - Full address
- Tap **"CLOSE"** to dismiss

## 🎨 UI Components

- **Top Card:** Source/Destination inputs and route buttons
- **Bottom Card:** POI category filters
- **FAB:** My Location button (right side)
- **MapView:** Full-screen interactive map
- **BottomSheet:** POI details dialog

## 🔧 Troubleshooting

### Issue: "Failed to resolve: com.mapbox.maps:android"
**Solution:** 
- Verify your Secret Token in `gradle.properties`
- Ensure it has `DOWNLOADS:READ` scope
- Sync Gradle again

### Issue: Map not loading
**Solution:**
- Check your Public Token in `strings.xml`
- Ensure you have internet connection
- Check Logcat for error messages

### Issue: Location not showing
**Solution:**
- Grant location permissions
- Enable GPS on your device
- Check if Google Play Services is installed

### Issue: Routes not calculating
**Solution:**
- Verify both source and destination are valid addresses
- Check internet connection
- Ensure Public Token is valid

### Issue: POIs not appearing
**Solution:**
- Ensure location permission is granted
- Move to a different area (some locations may have limited POI data)
- Check Logcat for API errors

## 📚 Key Classes & Methods

### MainActivity.java

| Method | Description |
|--------|-------------|
| `setupMap()` | Initializes MapView with Mapbox Streets style |
| `geocodeAndFindRoute()` | Converts addresses to coordinates using Search SDK |
| `calculateRoute()` | Requests routes using Navigation SDK |
| `drawRoutes()` | Visualizes multiple route alternatives |
| `findNearbyPOIs()` | Searches for POIs near current location |
| `addPOIMarker()` | Adds custom colored markers for POIs |
| `showPOIBottomSheet()` | Displays POI details in BottomSheet |

## 🏆 MVVM Architecture Notes

The current implementation is **MVVM-ready**. To fully implement MVVM:

1. **Create ViewModel:**
   ```java
   public class MapViewModel extends ViewModel {
       private MutableLiveData<List<SearchResult>> poisLiveData;
       private MutableLiveData<List<NavigationRoute>> routesLiveData;
       // ... business logic
   }
   ```

2. **Create Repository:**
   ```java
   public class MapRepository {
       private SearchEngine searchEngine;
       private MapboxNavigation navigation;
       // ... data operations
   }
   ```

3. **Observe in Activity:**
   ```java
   viewModel.getPOIs().observe(this, pois -> {
       // Update UI
   });
   ```

## 📄 License

This project is created for educational purposes as a final-year project.

## 🙏 Acknowledgments

- **Mapbox** for providing excellent SDKs and documentation
- **Google** for Material Design components
- **Android** development community

## 📞 Support

For issues or questions:
1. Check the [Mapbox Documentation](https://docs.mapbox.com/android/)
2. Review [Mapbox Examples](https://docs.mapbox.com/android/maps/examples/)
3. Check [Stack Overflow](https://stackoverflow.com/questions/tagged/mapbox)

---

**Built with ❤️ using Mapbox SDK**

**Project:** YatraSahayata (यात्रा सहायता)  
**Version:** 1.0  
**Last Updated:** January 2026
