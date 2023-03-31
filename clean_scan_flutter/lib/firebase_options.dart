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
    apiKey: 'AIzaSyBPj7DFYlfN8DY1Smph_uwheaCw2I7CtJ0',
    appId: '1:526270151048:web:aacdd78f4fa71e41f8223d',
    messagingSenderId: '526270151048',
    projectId: 'clean-scan-1cc4e',
    authDomain: 'clean-scan-1cc4e.firebaseapp.com',
    storageBucket: 'clean-scan-1cc4e.appspot.com',
    measurementId: 'G-ZBGFWPMWXM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgYh8Mynyo3wXkzU-YicGVA6SUBRNZk40',
    appId: '1:526270151048:android:bbe8ae232e5cdca1f8223d',
    messagingSenderId: '526270151048',
    projectId: 'clean-scan-1cc4e',
    storageBucket: 'clean-scan-1cc4e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCT-8G-PW1BPpCGpSplm65Zu-K46lVbtRs',
    appId: '1:526270151048:ios:e3e89ab0487ae2a6f8223d',
    messagingSenderId: '526270151048',
    projectId: 'clean-scan-1cc4e',
    storageBucket: 'clean-scan-1cc4e.appspot.com',
    iosClientId: '526270151048-1uvmrg1sqoj9mptd9tgur2k67keuptvs.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectNhk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCT-8G-PW1BPpCGpSplm65Zu-K46lVbtRs',
    appId: '1:526270151048:ios:e3e89ab0487ae2a6f8223d',
    messagingSenderId: '526270151048',
    projectId: 'clean-scan-1cc4e',
    storageBucket: 'clean-scan-1cc4e.appspot.com',
    iosClientId: '526270151048-1uvmrg1sqoj9mptd9tgur2k67keuptvs.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectNhk',
  );
}
