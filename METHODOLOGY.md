# METHODOLOGY

## 3.1 System Overview
The YatraSahayata (Application) is a mobile-based system designed to provide comprehensive navigation and route planning assistance. The system operates on a client-server architecture where the Android-based mobile application acts as the client, interacting with cloud-based mapping and navigation services (Mapbox) via authorized SDKs. The user interaction, including map manipulation, search queries, and route selection, is handled by the frontend. The complex geospatial processing, routing algorithms, and POI data retrieval are managed by the backend services provided by Mapbox.

The application provides the user with an intuitive interface for exploring maps, calculating routes with multiple alternatives, and discovering Points of Interest (POIs) such as gas stations and hotels. These interactions are processed by the application logic and SDKs to deliver real-time visual feedback. This architecture ensures high performance and reliability by leveraging robust cloud infrastructure for data-intensive tasks.

## 3.2 System Architecture
The YatraSahayata system architecture is designed to facilitate seamless interaction between the user interface, business logic, and external services. The application follows a modular design with clear separation of concerns:

1.  **Presentation Layer**: Handles UI rendering and user events using `MainActivity` and XML layouts. It manages the `MapView`, BottomSheets, and input controls.
2.  **SDK Integration Layer**: Acts as the bridge between the app and backend services. This includes `MapboxMaps`, `MapboxSearch`, and `MapboxNavigation` SDKs.
3.  **Data Source Layer**: Manages data flow from external APIs and local state (e.g., current location, cached map tiles).

This multi-layered design ensures that the application is scalable, maintainable, and testable.

## 3.3 Backend Implementation
Unlike traditional custom backend systems, YatraSahayata primarily leverages a Backend-as-a-Service (BaaS) model through **Mapbox Platform SDKs**.
*   **Routing Service**: The Navigation SDK communicates with Mapbox's routing engine to calculate optimal paths based on traffic and distance.
*   **Geocoding Service**: The Search SDK handles the conversion of addresses to coordinates (forward geocoding) and vice versa, providing autocomplete suggestions.
*   **Tile Service**: The Maps SDK fetches vector tiles dynamically to render the customized "Streets" map style.

This approach eliminates the need for maintaining a dedicated server for geospatial logic, ensuring high availability and access to up-to-date global map data.

## 3.4 Data Management
While the application relies heavily on dynamic cloud data, it manages strictly structured local state to ensure performance and consistency.
*   **Application State**: The app maintains transient state objects for `currentLocation`, `activeRoutes`, `poiMarkers`, and `searchHistory`.
*   **Data Models**: Java objects (POJOs) are used to represent Routes, Points, and Search Results, facilitating type-safe data handling.
*   **Lifecycle Management**: The architecture handles data persistence across Android lifecycle events (e.g., screen rotation) to prevent data loss.

Future iterations include the integration of a local Room database for persisting "Saved Places" and "Route History," further enhancing the offline capabilities of the system.

## 3.5 Frontend Implementation
YatraSahayata uses **Android Studio** as the primary IDE, focusing on usability and modern Material Design principles.
*   **User Interface**: Constructed using XML layouts (`activity_main.xml`), the UI features floating action buttons, card-based search inputs, and interactive bottom sheets (`bottom_sheet_poi_details.xml`) for a clean, unobtrusive experience.
*   **Component Logic**: The implementation uses **Java** and **ViewBinding** for type-safe interaction with UI elements. Logic is organized into modular methods (e.g., `setupMap`, `calculateRoute`) to improve readability and maintenance.
*   **Visual Feedback**: The frontend provides immediate visual cues, such as color-coded markers for different POI categories (Red for Gas, Orange for Cafes) and varying polyline styles for primary vs. alternative routes.

## 3.6 API Communication
Communication between the frontend and the backend services is handled via **RESTful-like SDK calls**.
*   **Standardized Requests**: The application uses specific SDK methods (e.g., `mapboxNavigation.requestRoutes`, `searchEngine.search`) which internally manage HTTP requests to Mapbox APIs.
*   **Asynchronous Processing**: All network operations are performed asynchronously to prevent blocking the main UI thread. Callbacks (e.g., `NavigationRouterCallback`, `SearchCallback`) are used to handle success and failure states properly.
*   **Error Handling**: The communication layer includes robust error handling to manage network connectivity issues or API limits gracefully.

## 3.7 Development Environment and Technology Stack
The development of YatraSahayata utilizes a modern, robust technology stack to ensure performance and compatibility with current Android standards.

### 3.7.1 Hardware Environment
Development and testing were conducted on hardware meeting the following specifications:
*   **Processor**: x86_64 CPU (Intel Core i5 or newer recommended)
*   **RAM**: 8 GB minimum (16 GB recommended for optimal Emulator performance)
*   **Storage**: SSD with at least 10 GB free space for Android SDKs and build artifacts.

### 3.7.2 Software Environment
The software environment consists of industry-standard tools:
*   **Operating System**: Windows / macOS / Linux
*   **IDE**: Android Studio (Latest Stable Version)
*   **Build System**: Gradle
*   **Version Control**: Git

### 3.7.3 Mapping & Navigation Environment
*   **Mapbox Maps SDK v11**: The core engine for map rendering and interaction.
*   **Mapbox Navigation SDK v3**: Provides the routing logic and navigation primitives.
*   **Mapbox Search SDK v2**: Powers the search bar and POI discovery features.

### 3.7.4 Android Development Environment
*   **Language**: Java 11 (Functionally compatible with Kotlin-based projects).
*   **SDK Versions**:
    *   **Min SDK**: 24 (Android 7.0)
    *   **Target SDK**: 34 (Android 14)
*   **Libraries**:
    *   **AndroidX / Jetpack**: For backward-compatible UI components.
    *   **Google Play Services Location**: For high-accuracy device location fusion.
