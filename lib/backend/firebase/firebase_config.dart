import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAzY0DZ2OKQC_ccJcncPim-ybSZO61G7-4",
            authDomain: "apnnews-dd790.firebaseapp.com",
            projectId: "apnnews-dd790",
            storageBucket: "apnnews-dd790.appspot.com",
            messagingSenderId: "813232080916",
            appId: "1:813232080916:web:8571dad421810410657f01"));
  } else {
    await Firebase.initializeApp();
  }
}
