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
    apiKey: 'AIzaSyBcFaief7_CxbO0a2oRqGDvW-B2KdEwi1U',
    appId: '1:815342080903:web:312b63a6934a6cb3deb922',
    messagingSenderId: '815342080903',
    projectId: 'my-movie-app-9cb43',
    authDomain: 'my-movie-app-9cb43.firebaseapp.com',
    storageBucket: 'my-movie-app-9cb43.appspot.com',
    measurementId: 'G-B8NWNDPK4W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2hxk6ZbhWIe0bvPKxFQwmhBkZcuH_LQk',
    appId: '1:815342080903:android:f2c265a19336dd63deb922',
    messagingSenderId: '815342080903',
    projectId: 'my-movie-app-9cb43',
    storageBucket: 'my-movie-app-9cb43.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUCCnLTDx-pQuoHsrTNLWAcCXUZZ7K_rY',
    appId: '1:815342080903:ios:eadf99e017577e62deb922',
    messagingSenderId: '815342080903',
    projectId: 'my-movie-app-9cb43',
    storageBucket: 'my-movie-app-9cb43.appspot.com',
    iosBundleId: 'com.example.myMovieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUCCnLTDx-pQuoHsrTNLWAcCXUZZ7K_rY',
    appId: '1:815342080903:ios:eadf99e017577e62deb922',
    messagingSenderId: '815342080903',
    projectId: 'my-movie-app-9cb43',
    storageBucket: 'my-movie-app-9cb43.appspot.com',
    iosBundleId: 'com.example.myMovieApp',
  );
}
