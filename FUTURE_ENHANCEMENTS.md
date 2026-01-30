# Future Enhancements Roadmap

This document outlines the technical roadmap for "YatraSahayata", converting high-level goals into actionable engineering tasks.

## 1. User Interface & Experience (UI/UX)
*   **Micro-Interactions (Phase 5)**:
    *   Implement "Hero" shared element transitions between the Search List and Route Details.
    *   Add Lottie based animations for status states (e.g., success checkmark, finding location loader).
    *   Add haptic feedback patterns (light impact for clicks, heavy for warnings).
*   **Adaptive Dark Mode**:
    *   Currently, we toggle map styles. We should implement a system-wide theme listener to auto-switch the entire app UI (cards, text, dialogs) based on the ambient light sensor or system settings.
*   **Landscape Navigation Mode**:
    *   Optimize the `ActiveNavigationActivity` layout for landscape orientation (e.g., side-by-side map and instruction panel) for better dashboard mounting support.

## 2. Advanced Navigation Features
*   **Offline Maps Integration**:
    *   Enhance `OfflineMapActivity` to allow users to download specific regions (rectangular bounding box).
    *   Implement smart caching for route requests to allow re-routing without internet if the user goes off-track within a cached zone.
*   **Real-Time Data Overlays**:
    *   Integrate a Weather API to show weather conditions along the route.
    *   Add a "Speed Limit" overlay that warns the user if they exceed the speed limit for the current road segment (requires richer map data).
*   **Voice Command Input**:
    *   Integrate a voice assistant (Android Speech Recognizer or Mapbox Voice) to allow setting destinations like "Navigate Home" without touching the screen.

## 3. Performance & Architecture
*   **Battery Optimization**:
    *   Refactor `ActiveNavigationActivity` to use a foreground service for location updates effectively, ensuring the app is not killed by the OS during long drives.
    *   Implement "Eco Mode" which reduces the map refresh rate (fps) when the user is driving straight for long distances to save battery.
*   **Code Modularization**:
    *   Refactor `MainActivity.java` (currently very large) into a Model-View-ViewModel (MVVM) architecture.
    *   Extract Navigation Logic into a standalone manager class to separate UI from business logic.

## 4. Social & Analytics
*   **Trip History & Analytics**:
    *   Persist detailed trip logs (Route taken, time duration, average speed) using Room Database.
    *   Visualize trip history on a calendar or map.
*   **Live Location Sharing**:
    *   Implement a "Share Trip" feature that generates a temporary web link (using Firebase or similar backend) where friends can track the user's real-time progress.

## 5. Testing & Reliability
*   **Automated Testing**:
    *   Add Espresso UI tests for the core Navigation flow.
    *   Add Unit tests for the Distance/Time calculation utility functions.
*   **Crash Reporting**:
    *   Integrate a crash reporting tool (like Crashlytics) to monitor stability in production.
