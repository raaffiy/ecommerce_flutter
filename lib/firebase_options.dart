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
    apiKey: 'AIzaSyDE1psUGbPUyEc8M2W3sxx0jwEO6psd6T4',
    appId: '1:32680173842:web:e7d14c030bd00d8a76d3cb',
    messagingSenderId: '32680173842',
    projectId: 'ecommerce-flutter-d7c41',
    authDomain: 'ecommerce-flutter-d7c41.firebaseapp.com',
    storageBucket: 'ecommerce-flutter-d7c41.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfuephiez4vOO3TfkCtheSfv7wy3tDlGI',
    appId: '1:32680173842:android:fbc1ee92966fce9976d3cb',
    messagingSenderId: '32680173842',
    projectId: 'ecommerce-flutter-d7c41',
    storageBucket: 'ecommerce-flutter-d7c41.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNYlPqKEnHEEHvi81Zt0CGwXQ_50RoyQ4',
    appId: '1:32680173842:ios:ff6eec9e3ef65b8776d3cb',
    messagingSenderId: '32680173842',
    projectId: 'ecommerce-flutter-d7c41',
    storageBucket: 'ecommerce-flutter-d7c41.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNYlPqKEnHEEHvi81Zt0CGwXQ_50RoyQ4',
    appId: '1:32680173842:ios:d85b74b0929bc39476d3cb',
    messagingSenderId: '32680173842',
    projectId: 'ecommerce-flutter-d7c41',
    storageBucket: 'ecommerce-flutter-d7c41.appspot.com',
    iosBundleId: 'com.example.ecommerce.RunnerTests',
  );
}
