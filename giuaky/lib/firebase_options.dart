import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCMCEtDNCQPRxVTpN3Eb5Dwlb5n72c89N8' ?? '',
    appId: '1:293220744348:web:d3c34417e20c9ad8954159' ?? '',
    messagingSenderId: '293220744348' ?? '',
    projectId: 'giuaky-dnt' ?? '',
    authDomain: 'giuaky-dnt.firebaseapp.com' ?? '',
    databaseURL: 'https://giuaky-dnt-default-rtdb.firebaseio.com' ?? '',
    storageBucket: 'giuaky-dnt.firebasestorage.app' ?? '',
    measurementId: 'G-G3RHE1HHWJ' ?? '',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGgyTivSPRGqGyTKom_cras_W6cMaRT0U' ?? '',
    appId: '1:293220744348:android:6200a2ac2fdd131b954159' ?? '',
    messagingSenderId: '293220744348' ?? '',
    projectId: 'giuaky-dnt' ?? '',
    databaseURL: 'https://giuaky-dnt-default-rtdb.firebaseio.com' ?? '',
    storageBucket: 'giuaky-dnt.firebasestorage.app' ?? '',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAUTWaLXMCsZdm8BOioX7e-IxhtDZ3TNM' ?? '',
    appId: '1:293220744348:ios:65a0bebf81c5dfa7954159' ?? '',
    messagingSenderId: '293220744348' ?? '',
    projectId: 'giuaky-dnt' ?? '',
    databaseURL: 'https://giuaky-dnt-default-rtdb.firebaseio.com' ?? '',
    storageBucket: 'giuaky-dnt.firebasestorage.app' ?? '',
    iosBundleId: 'com.example.giuaky' ?? '',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAUTWaLXMCsZdm8BOioX7e-IxhtDZ3TNM' ?? '',
    appId: '1:293220744348:ios:65a0bebf81c5dfa7954159' ?? '',
    messagingSenderId: '293220744348' ?? '',
    projectId: 'giuaky-dnt' ?? '',
    databaseURL: 'https://giuaky-dnt-default-rtdb.firebaseio.com' ?? '',
    storageBucket: 'giuaky-dnt.firebasestorage.app' ?? '',
    iosBundleId: 'com.example.giuaky' ?? '',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCMCEtDNCQPRxVTpN3Eb5Dwlb5n72c89N8' ?? '',
    appId: '1:293220744348:web:1847ee359430829e954159' ?? '',
    messagingSenderId: '293220744348' ?? '',
    projectId: 'giuaky-dnt' ?? '',
    authDomain: 'giuaky-dnt.firebaseapp.com' ?? '',
    databaseURL: 'https://giuaky-dnt-default-rtdb.firebaseio.com' ?? '',
    storageBucket: 'giuaky-dnt.firebasestorage.app' ?? '',
    measurementId: 'G-DRENKE3EFL' ?? '',
  );
}
