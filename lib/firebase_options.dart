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
    apiKey: 'AIzaSyDnou-9-AcpoEm2NMFSRQ3QQ88C3A7MZRs',
    appId: '1:1047406277123:web:ab382e3f521bb928a05436',
    messagingSenderId: '1047406277123',
    projectId: 'instagram-clone-12d85',
    authDomain: 'instagram-clone-12d85.firebaseapp.com',
    storageBucket: 'instagram-clone-12d85.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJyv5Ha6RhuiY5RiaxADXgSMg0jbD47Do',
    appId: '1:1047406277123:android:e06604c1fcae8710a05436',
    messagingSenderId: '1047406277123',
    projectId: 'instagram-clone-12d85',
    storageBucket: 'instagram-clone-12d85.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBieVGy22Z90kGBs6K7JbdrMn03yazTwPE',
    appId: '1:1047406277123:ios:dd12f61aa289f423a05436',
    messagingSenderId: '1047406277123',
    projectId: 'instagram-clone-12d85',
    storageBucket: 'instagram-clone-12d85.appspot.com',
    iosBundleId: 'com.sairatec.instagramCloneApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBieVGy22Z90kGBs6K7JbdrMn03yazTwPE',
    appId: '1:1047406277123:ios:0378e2b1f12c3441a05436',
    messagingSenderId: '1047406277123',
    projectId: 'instagram-clone-12d85',
    storageBucket: 'instagram-clone-12d85.appspot.com',
    iosBundleId: 'com.sairatec.instagramCloneApp.RunnerTests',
  );
}
