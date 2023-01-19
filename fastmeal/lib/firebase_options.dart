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
    apiKey: 'AIzaSyBHU5qk3F7zX52z1UdULobmqmgrvoDTRVQ',
    appId: '1:13451873571:web:9c3c4c35ba77c21a7a5096',
    messagingSenderId: '13451873571',
    projectId: 'fastmealapplication',
    authDomain: 'fastmealapplication.firebaseapp.com',
    storageBucket: 'fastmealapplication.appspot.com',
    measurementId: 'G-3QGWXNZP58',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbLZ1qW_ffIhGHuQySL0olwNxKSMyZS9g',
    appId: '1:13451873571:android:31e22e1d0cf2db277a5096',
    messagingSenderId: '13451873571',
    projectId: 'fastmealapplication',
    storageBucket: 'fastmealapplication.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaVA3pj0i7ZqtftaMDYDYG0DoVtI9Y8us',
    appId: '1:13451873571:ios:23affe8b3f5f942c7a5096',
    messagingSenderId: '13451873571',
    projectId: 'fastmealapplication',
    storageBucket: 'fastmealapplication.appspot.com',
    iosClientId: '13451873571-sb8mcjfvem7vlrveu5fak5c4i9j449qa.apps.googleusercontent.com',
    iosBundleId: 'com.example.fastmeal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAaVA3pj0i7ZqtftaMDYDYG0DoVtI9Y8us',
    appId: '1:13451873571:ios:23affe8b3f5f942c7a5096',
    messagingSenderId: '13451873571',
    projectId: 'fastmealapplication',
    storageBucket: 'fastmealapplication.appspot.com',
    iosClientId: '13451873571-sb8mcjfvem7vlrveu5fak5c4i9j449qa.apps.googleusercontent.com',
    iosBundleId: 'com.example.fastmeal',
  );
}