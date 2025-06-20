// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDq9K5RDQaCCcGujWi6rJn4cmKA9M3aEJc',
    appId: '1:641576625379:web:90af45bc3cb1984d1811d6',
    messagingSenderId: '641576625379',
    projectId: 'fdtissage',
    authDomain: 'fdtissage.firebaseapp.com',
    storageBucket: 'fdtissage.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAx0MDhdMNgMW9jbY29TKOuj20d96UT8sc',
    appId: '1:641576625379:android:cb20ad6736ebbab41811d6',
    messagingSenderId: '641576625379',
    projectId: 'fdtissage',
    storageBucket: 'fdtissage.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcBhZsQa4WErQFMe9QA9F6kEeZ1t4xwpU',
    appId: '1:641576625379:ios:fa2201ece3b9fabf1811d6',
    messagingSenderId: '641576625379',
    projectId: 'fdtissage',
    storageBucket: 'fdtissage.firebasestorage.app',
    iosBundleId: 'space.fdtt.tissapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcBhZsQa4WErQFMe9QA9F6kEeZ1t4xwpU',
    appId: '1:641576625379:ios:fa2201ece3b9fabf1811d6',
    messagingSenderId: '641576625379',
    projectId: 'fdtissage',
    storageBucket: 'fdtissage.firebasestorage.app',
    iosBundleId: 'space.fdtt.tissapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDq9K5RDQaCCcGujWi6rJn4cmKA9M3aEJc',
    appId: '1:641576625379:web:15f7df8fabac17401811d6',
    messagingSenderId: '641576625379',
    projectId: 'fdtissage',
    authDomain: 'fdtissage.firebaseapp.com',
    storageBucket: 'fdtissage.firebasestorage.app',
  );
}
