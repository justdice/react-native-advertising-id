
# react-native-advertising-id
[![npm version](https://badge.fury.io/js/react-native-advertising-id.svg)](https://badge.fury.io/js/react-native-advertising-id)

Consistent access to Advertising Id (AAID/GAID and IDFA) for Android and iOS on React Native.

## TOC

* [Getting started](#getting-started)
  * [Automatic Linking](#mostly-automatic-installation)
  * [Manual Linking - iOS](#ios)
  * [Manual Linking - Android](#android)
* [Usage](#usage)

## Getting started

`$ npm install react-native-advertising-id --save`

### Mostly automatic installation

`$ react-native link react-native-advertising-id`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-advertising-id` and add `RNAdvertisingId.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNAdvertisingId.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import info.applike.advertisingid.RNAdvertisingIdPackage;` to the imports at the top of the file
  - Add `new RNAdvertisingIdPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
    ```gradle
    include ':react-native-advertising-id'
    project(':react-native-advertising-id').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-advertising-id/android')
    ```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
    ```gradle
      compile project(':react-native-advertising-id')
    ```
4. Update your `mainfest.xml` and declare that your app is an Ad Manager app, as instructed on [Google's Ad Manager guide](https://developers.google.com/ad-manager/mobile-ads-sdk/android/quick-start#update_your_androidmanifestxml):
```xml
<manifest>
    <application>
        <meta-data
            android:name="com.google.android.gms.ads.AD_MANAGER_APP"
            android:value="true"/>
    </application>
</manifest>
```

## Usage
`react-native-advertising-id` module provides a method `getAdvertisingId()` that returns a Promise.
This resolves in an object containing `advertisingId` as a string representing the GAID/AAID or IDFA depending on the platform, and `isLimitAdTrackingEnabled` indicating wether the user opted to restrict the usage of his AdvertisingId or not. (Note: If enabled on iOS, advertisingId will result in an empty string).
```javascript
import RNAdvertisingId from 'react-native-advertising-id';

  RNAdvertisingId.getAdvertisingId()
    .then(response => {
      this.setState({
        advertisingId: response.advertisingId,
        isLimitAdTrackingEnabled: response.isLimitAdTrackingEnabled,
      });
    })
    .catch(error => console.error(error));
```
  
