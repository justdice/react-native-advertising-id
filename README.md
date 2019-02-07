
# react-native-advertising-id

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
  - Add `import com.reactlibrary.RNAdvertisingIdPackage;` to the imports at the top of the file
  - Add `new RNAdvertisingIdPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-advertising-id'
  	project(':react-native-advertising-id').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-advertising-id/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-advertising-id')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNAdvertisingId.sln` in `node_modules/react-native-advertising-id/windows/RNAdvertisingId.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Advertising.Id.RNAdvertisingId;` to the usings at the top of the file
  - Add `new RNAdvertisingIdPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNAdvertisingId from 'react-native-advertising-id';

// TODO: What to do with the module?
RNAdvertisingId;
```
  