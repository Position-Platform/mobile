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
    apiKey: 'AIzaSyAGpMhtZOISzv8JM4jfd5pXAyl6FX3Vv0w',
    appId: '1:269614845547:web:595f874631dc534984ab2e',
    messagingSenderId: '269614845547',
    projectId: 'position-79196',
    authDomain: 'position-79196.firebaseapp.com',
    databaseURL: 'https://position-79196.firebaseio.com',
    storageBucket: 'position-79196.appspot.com',
    measurementId: 'G-EH0MWZ5DF8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFnJZLnSb3iAOARbf_XiBYOCIkDePXx7Y',
    appId: '1:269614845547:android:d0827122c7391f5384ab2e',
    messagingSenderId: '269614845547',
    projectId: 'position-79196',
    databaseURL: 'https://position-79196.firebaseio.com',
    storageBucket: 'position-79196.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqw0_RYV3n9Mc7Zq82ftQIeO3SAHO_-gs',
    appId: '1:269614845547:ios:78ca466dcd81af6284ab2e',
    messagingSenderId: '269614845547',
    projectId: 'position-79196',
    databaseURL: 'https://position-79196.firebaseio.com',
    storageBucket: 'position-79196.appspot.com',
    androidClientId:
        '269614845547-66vf8jpjekelbo5evtfv2u6l03if01dn.apps.googleusercontent.com',
    iosClientId:
        '269614845547-hb7pu91c2a8jl888biv4946q5tm0ulm2.apps.googleusercontent.com',
    iosBundleId: 'cm.geosmfamily.position',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqw0_RYV3n9Mc7Zq82ftQIeO3SAHO_-gs',
    appId: '1:269614845547:ios:78ca466dcd81af6284ab2e',
    messagingSenderId: '269614845547',
    projectId: 'position-79196',
    databaseURL: 'https://position-79196.firebaseio.com',
    storageBucket: 'position-79196.appspot.com',
    androidClientId:
        '269614845547-66vf8jpjekelbo5evtfv2u6l03if01dn.apps.googleusercontent.com',
    iosClientId:
        '269614845547-hb7pu91c2a8jl888biv4946q5tm0ulm2.apps.googleusercontent.com',
    iosBundleId: 'cm.geosmfamily.position',
  );
}