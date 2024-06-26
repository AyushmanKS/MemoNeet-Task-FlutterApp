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
    apiKey: 'AIzaSyD3MtuazJP3HqN8frk4Nv_zzd7im0O1x7I',
    appId: '1:918321022715:web:c1ceed86385deaa100125e',
    messagingSenderId: '918321022715',
    projectId: 'memoneet-taskapp',
    authDomain: 'memoneet-taskapp.firebaseapp.com',
    storageBucket: 'memoneet-taskapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcS35ipPIxI18X3-bN3nYiWSP0lpFv3Go',
    appId: '1:918321022715:android:c63801967dabeacc00125e',
    messagingSenderId: '918321022715',
    projectId: 'memoneet-taskapp',
    storageBucket: 'memoneet-taskapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpTzsSiJfmi7GPiIQ9kNi4zofY5GDv_dI',
    appId: '1:918321022715:ios:b933c7ff567218a000125e',
    messagingSenderId: '918321022715',
    projectId: 'memoneet-taskapp',
    storageBucket: 'memoneet-taskapp.appspot.com',
    iosBundleId: 'com.example.memoneetTaskFlutterapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpTzsSiJfmi7GPiIQ9kNi4zofY5GDv_dI',
    appId: '1:918321022715:ios:f3a84bcc908811df00125e',
    messagingSenderId: '918321022715',
    projectId: 'memoneet-taskapp',
    storageBucket: 'memoneet-taskapp.appspot.com',
    iosBundleId: 'com.example.memoneetTaskFlutterapp.RunnerTests',
  );
}
