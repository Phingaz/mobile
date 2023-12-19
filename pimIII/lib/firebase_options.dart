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
    apiKey: 'AIzaSyB2XFO_DFIbqc4GVe1VAno5XnPHbWFxiDg',
    appId: '1:378621938060:web:6450a571081b662d556ea9',
    messagingSenderId: '378621938060',
    projectId: 'pimiii-dcc44',
    authDomain: 'pimiii-dcc44.firebaseapp.com',
    storageBucket: 'pimiii-dcc44.appspot.com',
    measurementId: 'G-TFK193J6ZN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtFSAVf7i32qHQriTSc1xHyUbrX6GtEZo',
    appId: '1:378621938060:android:a1c3f8701023e556556ea9',
    messagingSenderId: '378621938060',
    projectId: 'pimiii-dcc44',
    storageBucket: 'pimiii-dcc44.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6R8TVdcjtJWbByVQ5HC1KFpH4VcPrLmM',
    appId: '1:378621938060:ios:6d0dfa0bc2c7d85d556ea9',
    messagingSenderId: '378621938060',
    projectId: 'pimiii-dcc44',
    storageBucket: 'pimiii-dcc44.appspot.com',
    iosBundleId: 'com.example.pimiii',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6R8TVdcjtJWbByVQ5HC1KFpH4VcPrLmM',
    appId: '1:378621938060:ios:132e8ca824aa7349556ea9',
    messagingSenderId: '378621938060',
    projectId: 'pimiii-dcc44',
    storageBucket: 'pimiii-dcc44.appspot.com',
    iosBundleId: 'com.example.pimiii.RunnerTests',
  );
}
