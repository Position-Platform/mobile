// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

  static FirebaseOptions web = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_WEB_API_KEY']!,
    appId: dotenv.env['FIREBASE_WEB_APP_ID']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSENGING_SENDER']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN']!,
    databaseURL: dotenv.env['FIREBASE_DATABASE_URL']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
    measurementId: dotenv.env['FIREBASE_MEASUREMENT_ID']!,
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_ANDROID_API_KEY']!,
    appId: dotenv.env['FIREBASE_ANDROID_APP_ID']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSENGING_SENDER']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    databaseURL: dotenv.env['FIREBASE_DATABASE_URL']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_IOS_API_KEY']!,
    appId: dotenv.env['FIREBASE_IOS_APP_ID']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSENGING_SENDER']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    databaseURL: dotenv.env['FIREBASE_DATABASE_URL']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
    androidClientId: dotenv.env['FIREBASE_ANDROID_CLIENT_ID']!,
    iosClientId: dotenv.env['FIREBASE_IOS_CLIENT_ID']!,
    iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID']!,
  );

  static FirebaseOptions macos = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_IOS_API_KEY']!,
    appId: dotenv.env['FIREBASE_IOS_APP_ID']!,
    messagingSenderId: dotenv.env['FIREBASE_MESSENGING_SENDER']!,
    projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    databaseURL: dotenv.env['FIREBASE_DATABASE_URL']!,
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
    androidClientId: dotenv.env['FIREBASE_ANDROID_CLIENT_ID']!,
    iosClientId: dotenv.env['FIREBASE_IOS_CLIENT_ID']!,
    iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID']!,
  );
}
