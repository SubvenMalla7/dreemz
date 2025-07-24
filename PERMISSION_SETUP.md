# Permission Handler Setup Guide

This guide explains how to set up and use the permission handler package for camera and storage access in the Flutter app.

## 📱 **Android Configuration**

### **1. AndroidManifest.xml Permissions**
The following permissions have been added to `android/app/src/main/AndroidManifest.xml`:

```xml
<!-- Permissions for camera and storage access -->
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />

<!-- Camera feature -->
<uses-feature android:name="android.hardware.camera" android:required="false" />
<uses-feature android:name="android.hardware.camera.autofocus" android:required="false" />
```

### **2. Android Permission Levels**
- **Camera Permission**: Required for taking photos
- **Storage Permission**: Required for accessing gallery images
- **READ_MEDIA_IMAGES**: Required for Android 13+ (API 33+)

## 🍎 **iOS Configuration**

### **1. Info.plist Permissions**
The following permissions have been added to `ios/Runner/Info.plist`:

```xml
<!-- Camera Permission -->
<key>NSCameraUsageDescription</key>
<string>This app needs camera access to take photos for adding to favorites.</string>

<!-- Photo Library Permission -->
<key>NSPhotoLibraryUsageDescription</key>
<string>This app needs photo library access to select images for adding to favorites.</string>

<!-- Photo Library Add Permission (iOS 11+) -->
<key>NSPhotoLibraryAddUsageDescription</key>
<string>This app needs permission to save photos to your photo library.</string>
```

## 🔧 **Dependencies**

### **1. pubspec.yaml**
The permission handler package is already included:

```yaml
dependencies:
  permission_handler: ^12.0.1
  image_picker: ^1.1.2
```

## 🛠 **Usage in Code**

### **1. Permission Helper Utility**
Created `lib/core/util/permission_helper.dart` with helper methods:

```dart
// Request camera permission
await PermissionHelper.requestCameraPermission();

// Request storage permission
await PermissionHelper.requestStoragePermission();

// Check permission status
await PermissionHelper.isCameraPermissionGranted();
await PermissionHelper.isStoragePermissionGranted();
```

### **2. Image Picker Widget**
The `ImagePickerWidget` handles permissions automatically:

- **Camera Access**: Requests camera permission before taking photos
- **Gallery Access**: Requests storage permission before accessing gallery
- **Error Handling**: Shows user-friendly error messages
- **Settings Link**: Direct link to app settings if permissions are denied

## 📋 **Permission Flow**

### **1. Camera Permission Flow**
1. User taps camera option
2. App requests camera permission
3. If granted → Open camera
4. If denied → Show permission dialog with settings link

### **2. Storage Permission Flow**
1. User taps gallery option
2. App requests storage permission
3. If granted → Open gallery
4. If denied → Show permission dialog with settings link

## 🚀 **Testing Permissions**

### **1. Test Camera Permission**
```bash
flutter run
# Tap floating action button
# Select "Camera"
# Grant camera permission when prompted
```

### **2. Test Gallery Permission**
```bash
flutter run
# Tap floating action button
# Select "Gallery"
# Grant storage permission when prompted
```

### **3. Test Permission Denial**
```bash
flutter run
# Deny permissions when prompted
# Verify permission dialog appears
# Test "Settings" button functionality
```

## 🔒 **Security Considerations**

### **1. Permission Best Practices**
- **Minimal Permissions**: Only request permissions when needed
- **Clear Descriptions**: Use clear, user-friendly permission descriptions
- **Graceful Degradation**: Handle permission denial gracefully
- **Settings Access**: Provide easy access to app settings

### **2. Data Privacy**
- **Local Storage**: Images are stored locally on device
- **No Cloud Upload**: Images are not uploaded to external servers
- **User Control**: Users can remove images from favorites
- **File Cleanup**: Local files are deleted when removed from favorites

## 🐛 **Troubleshooting**

### **1. Common Issues**
- **Permission Denied**: Check if permissions are properly configured
- **Camera Not Working**: Verify camera feature is not required
- **Gallery Access**: Ensure storage permissions are granted
- **iOS Build Issues**: Verify Info.plist contains all required keys

### **2. Debug Steps**
1. Check AndroidManifest.xml permissions
2. Verify Info.plist permission descriptions
3. Test on both Android and iOS devices
4. Check permission status in device settings
5. Verify app has necessary capabilities

## 📱 **Platform-Specific Notes**

### **Android**
- **API 33+**: Uses `READ_MEDIA_IMAGES` instead of `READ_EXTERNAL_STORAGE`
- **Camera Features**: Marked as not required for better compatibility
- **Storage Access**: Handles both legacy and modern storage access

### **iOS**
- **Photo Library**: Requires both read and write permissions
- **Camera**: Requires camera usage description
- **Privacy**: All permissions require user-friendly descriptions

## ✅ **Verification Checklist**

- [ ] Android permissions added to AndroidManifest.xml
- [ ] iOS permissions added to Info.plist
- [ ] Permission helper utility created
- [ ] Image picker widget integrated
- [ ] Error handling implemented
- [ ] Settings access provided
- [ ] Tested on Android device
- [ ] Tested on iOS device
- [ ] Permission denial flow tested
- [ ] Local image handling verified 