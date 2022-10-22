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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSUXV44S3ieJwzN8OIC4l2BFosFTrcN8k',
    appId: '1:20338719985:android:2e78b947c5da97639efd50',
    messagingSenderId: '20338719985',
    projectId: 'spajam2022-125e3',
    databaseURL: 'https://spajam2022-125e3-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'spajam2022-125e3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqmY7n-duReGr5a76Ga8D5sIRYn9E70nk',
    appId: '1:20338719985:ios:ef514ede06b774fd9efd50',
    messagingSenderId: '20338719985',
    projectId: 'spajam2022-125e3',
    databaseURL: 'https://spajam2022-125e3-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'spajam2022-125e3.appspot.com',
    iosClientId: '20338719985-thft8p2uushk870rusv301i7prf96mb9.apps.googleusercontent.com',
    iosBundleId: 'io.quiz.amaikanji.spajam2022',
  );
}