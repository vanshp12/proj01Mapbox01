# System Prompt / Project Specification for YatraSahayata

**Role:** You are an expert Android Developer specializing in geospatial applications, Mapbox SDKs, and Material Design 3.

**Objective:** Build a production-ready Android application named **"YatraSahayata"** (Journey Helper). This app is a comprehensive navigation suite similar to Google Maps but built using the Mapbox stack.

## 1. Technology Stack & Configuration
*   **OS:** Android (Min SDK 24, Target SDK 34).
*   **Language:** Java (compatible with Kotlin interoperability if needed, but primary requests are in Java).
*   **Build System:** Gradle (Kotlin DSL).
*   **Core SDKs:**
    *   `mapbox-maps-android:11.0.0`
    *   `mapbox-search-android:2.0.0`
    *   `mapbox-navigation-android:3.0.0`
    *   `play-services-location:21.0.1`
*   **Architecture:** MVVM-ready (Clean separation of concerns: Activities -> Managers/Services -> Repositories -> Room Database).
*   **UI Toolkit:** XML Layouts with ViewBinding, Material Components (M3).

## 2. Core Features & Requirements

### A. Map Interface (Home Screen)
1.  **Map Display:** Full-screen map using `MapView`.
    *   Style: Mapbox Streets (Day/Night mode support).
    *   Controls: Compass, Scale Bar, My Location FAB (Floating Action Button).
    *   Behavior: Smooth camera transitions, double-tap to zoom, rotate and tilt gestures.
2.  **Location Tracking:**
    *   Implement a "Puck" (Blue dot) for user location.
    *   Handle Android Runtime Permissions (`ACCESS_FINE_LOCATION`, `ACCESS_COARSE_LOCATION`) gracefully.

### B. Search & Discovery
1.  **Search Bar:** A floating "Google Maps Style" search capsule at the top.
    *   Inputs: Source (Default to "Your Location") and Destination.
    *   Functionality: Autocomplete suggestions using Mapbox Search SDK.
2.  **POI Categories:** Chips or Buttons below the search bar for quick discovery:
    *   **Gas Stations:** Search nearby, display with Red markers.
    *   **Restaurants/Cafes:** Search nearby, display with Orange markers.
    *   **Hotels:** Search nearby, display with Purple markers.
3.  **POI Details:**
    *   Clicking a marker opens a **BottomSheet** displaying: Name, Category (with Emoji), Address, and a "Navigate" button.

### C. Routing & Navigation
1.  **Route Calculation:**
    *   Use Mapbox Navigation SDK to calculate routes between Source and Destination.
    *   Support multiple profiles: **Driving** (traffic-aware), **Walking**, **Cycling**.
    *   **Alternatives:** Fetch and display up to 2-3 alternative routes.
2.  **Route Visualization:**
    *   **Primary Route:** Thick Blue Polyline (e.g., `#009688`, width 8px).
    *   **Alternative Routes:** Thinner Gray Polylines (e.g., `#9E9E9E`, width 5px).
    *   **Camera:** Auto-zoom to fit the route "Bounding Box" with padding.
3.  **Navigation Mode:**
    *   Dedicated UI overlay for active turn-by-turn navigation.
    *   **Top Banner:** Next maneuver instruction (e.g., "Turn right in 200m") with directional icon.
    *   **Bottom Banner:** ETA, Distance Remaining, Time Remaining.
    *   **Voice Guidance:** Text-to-Speech (TTS) announcements for maneuvers.
    *   **Simulation:** Debug option to simulate driving the route.

### D. Data Persistence (Room Database)
1.  **Trip History:** Automatically save completed trips (Start/End address, Distance, Duration, Date).
2.  **Saved Places:** Allow users to "Bookmark" locations (Home, Work, Favorites).
    *   Table columns: ID, Name, Address, Lat, Lng, Category.

## 3. UI/UX Design Guidelines
*   **Aesthetics:** High-end, "Glassmorphism" touches where appropriate (semi-transparent backgrounds).
*   **Interactions:** Smooth animations for showing/hiding BottomSheets and FABs.
*   **Colors:** Use semantic colors:
    *   Primary: Deep Blue/Teal (Navigation).
    *   Error/Stop: Red.
    *   Warning: Amber.
    *   Success: Green.

## 4. Implementation Steps for the LLM
Please generate the code in the following order:
1.  **Dependencies:** `build.gradle.kts` setup with Mapbox and Room.
2.  **Manifest:** Permissions and Activity declaration.
3.  **Layouts:** `activity_main.xml` (CoordinatorLayout based) and `item_poi_bottom_sheet.xml`.
4.  **Database:** Room Entities (`Trip`, `SavedPlace`), DAOs, and Database class.
5.  **Logic (MainActivity):**
    *   Initialize Mapbox.
    *   Setup Location Component.
    *   Implement Search Callback.
    *   Implement Route Fetching & Drawing.
    *   Implement POI Search & Marker Rendering.
    *   Connect UI events (Click listeners etc).

**Constraint:** Ensure all Mapbox tokens (Public `pk.*` and Secret `sk.*`) are handled via `gradle.properties` references and NOT hardcoded in the source.
