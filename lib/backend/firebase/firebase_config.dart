import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyClVa09d2qXDlYwFIvgW-TtXwp4cgbo92Q",
            authDomain: "secondhandbazaar-b2ebe.firebaseapp.com",
            projectId: "secondhandbazaar-b2ebe",
            storageBucket: "secondhandbazaar-b2ebe.appspot.com",
            messagingSenderId: "76826674926",
            appId: "1:76826674926:web:d78ffd5e12a0c80acf55ff"));
  } else {
    await Firebase.initializeApp();
  }
}
