// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBeg9xBhu1KX_EVi8pwAzJ_6rcEdf33NDI',
    appId: '1:842995137237:web:31eb9b8826794a8d4ec05c',
    messagingSenderId: '842995137237',
    projectId: 'messenger-2c623',
    authDomain: 'messenger-2c623.firebaseapp.com',
    databaseURL: 'https://messenger-2c623-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'messenger-2c623.appspot.com',
    measurementId: 'G-JM8HHYJTB6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCg0Dd4oFtOQ9H2lCYLpR2kKedZwfWYS1A',
    appId: '1:842995137237:android:281aed4ab0dabd4d4ec05c',
    messagingSenderId: '842995137237',
    projectId: 'messenger-2c623',
    databaseURL: 'https://messenger-2c623-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'messenger-2c623.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASw_R16--8FbQFB2WC0jSDKYUs1grAhWg',
    appId: '1:842995137237:ios:5274d41cf99afe214ec05c',
    messagingSenderId: '842995137237',
    projectId: 'messenger-2c623',
    databaseURL: 'https://messenger-2c623-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'messenger-2c623.appspot.com',
    iosBundleId: 'com.example.messenger',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASw_R16--8FbQFB2WC0jSDKYUs1grAhWg',
    appId: '1:842995137237:ios:3ee1da5f78c6511e4ec05c',
    messagingSenderId: '842995137237',
    projectId: 'messenger-2c623',
    databaseURL: 'https://messenger-2c623-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'messenger-2c623.appspot.com',
    iosBundleId: 'com.example.messenger.RunnerTests',
  );
}
