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
    apiKey: 'AIzaSyALnyMiRVVOltsWkyhUkhl4sKmgJmbPBus',
    appId: '1:821315933794:web:d2ebf9084e0caad18f233b',
    messagingSenderId: '821315933794',
    projectId: 'khaliq-home',
    authDomain: 'khaliq-home.firebaseapp.com',
    storageBucket: 'khaliq-home.appspot.com',
    measurementId: 'G-Z4L5D0JPY3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBuNTUoXSbEEDzoL_wi9PcIcLD3oX5mYY',
    appId: '1:821315933794:android:6eff0ce4889b57818f233b',
    messagingSenderId: '821315933794',
    projectId: 'khaliq-home',
    storageBucket: 'khaliq-home.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwJctLhdZLVZkShjgCyqsgmBEnqd1JEnY',
    appId: '1:821315933794:ios:d11aae503d85ed6e8f233b',
    messagingSenderId: '821315933794',
    projectId: 'khaliq-home',
    storageBucket: 'khaliq-home.appspot.com',
    iosBundleId: 'com.example.flutterApptest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwJctLhdZLVZkShjgCyqsgmBEnqd1JEnY',
    appId: '1:821315933794:ios:cd8a51b88b3a420f8f233b',
    messagingSenderId: '821315933794',
    projectId: 'khaliq-home',
    storageBucket: 'khaliq-home.appspot.com',
    iosBundleId: 'com.example.flutterApptest.RunnerTests',
  );
}
