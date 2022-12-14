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
    apiKey: 'AIzaSyBRY5vOPSnOTz8oXNpPwYpAlSa7IyaqbEI',
    appId: '1:477013321773:web:b72259ac068dd6762d70a4',
    messagingSenderId: '477013321773',
    projectId: 'bayan-10e5e',
    authDomain: 'bayan-10e5e.firebaseapp.com',
    storageBucket: 'bayan-10e5e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDp1ackYVQDUSVcJlo_tx08vBdOu6Wyaq0',
    appId: '1:477013321773:android:b812ca9faa305f5d2d70a4',
    messagingSenderId: '477013321773',
    projectId: 'bayan-10e5e',
    storageBucket: 'bayan-10e5e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtCn9THT3P_xcScNmUdmCdmWMM5-ABPxk',
    appId: '1:477013321773:ios:b3955132182a58dd2d70a4',
    messagingSenderId: '477013321773',
    projectId: 'bayan-10e5e',
    storageBucket: 'bayan-10e5e.appspot.com',
    iosClientId: '477013321773-tclh24b9on6b9h4u95o429d77quctrhq.apps.googleusercontent.com',
    iosBundleId: 'com.example.myappppp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtCn9THT3P_xcScNmUdmCdmWMM5-ABPxk',
    appId: '1:477013321773:ios:b3955132182a58dd2d70a4',
    messagingSenderId: '477013321773',
    projectId: 'bayan-10e5e',
    storageBucket: 'bayan-10e5e.appspot.com',
    iosClientId: '477013321773-tclh24b9on6b9h4u95o429d77quctrhq.apps.googleusercontent.com',
    iosBundleId: 'com.example.myappppp',
  );
}
