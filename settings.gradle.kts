pluginManagement {
    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    // Use PREFER_SETTINGS to allow Mapbox repository configuration
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
    repositories {
        google()
        mavenCentral()
        
        // Mapbox Maven repository with Secret Token authentication
        maven {
            url = uri("https://api.mapbox.com/downloads/v2/releases/maven")
            credentials {
                // Username is always "mapbox"
                username = "mapbox"
                // Password is your Secret Downloads Token from gradle.properties
                password = providers.gradleProperty("MAPBOX_DOWNLOADS_TOKEN").getOrElse("")
            }
            authentication {
                create<BasicAuthentication>("basic")
            }
        }
        
        // JitPack repository for MPAndroidChart
        maven {
            url = uri("https://jitpack.io")
        }
    }
}

rootProject.name = "YatraSahayata"
include(":app")
