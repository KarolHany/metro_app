# Google Maps Setup Guide

## 🗺️ **Setup Required for Route Maps**

To use the route map functionality, you need to set up a Google Maps API key.

### **Step 1: Get Google Maps API Key**

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the following APIs:
   - Maps SDK for Android
   - Maps SDK for iOS
   - Directions API (for route calculations)
4. Go to "Credentials" and create an API key
5. Copy your API key

### **Step 2: Configure Android**

Replace `YOUR_GOOGLE_MAPS_API_KEY_HERE` in:
```
android/app/src/main/AndroidManifest.xml
```

### **Step 3: Configure iOS**

Replace `YOUR_GOOGLE_MAPS_API_KEY_HERE` in:
```
ios/Runner/Info.plist
```

### **Step 4: Restrict API Key (Recommended)**

1. In Google Cloud Console, go to your API key
2. Click "Restrict key"
3. Restrict to your app's package name:
   - Android: `com.example.metro_app`
   - iOS: Your bundle identifier

## 🚀 **Features Available After Setup**

- **Interactive Maps**: Show current location and selected station
- **Route Visualization**: Display route from current location to station
- **Distance Calculation**: Show actual distance in kilometers
- **Google Maps Integration**: Open full directions in Google Maps app
- **Real-time Location**: Get accurate GPS coordinates

## ⚠️ **Important Notes**

- The API key is required for maps to work
- Without the key, the app will show an error when trying to open maps
- Keep your API key secure and don't commit it to public repositories
- Consider using environment variables for production apps

## 🔧 **Testing**

After setup:
1. Select a station in the dropdown
2. Click the map icon (🗺️) next to the dropdown
3. The route map should open showing your location and the station
4. You can also click "Get Directions" to open in Google Maps

