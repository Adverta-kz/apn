import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBsvyxQdMS-ySALBiAlInEpqXYZVx2CaW4",
            authDomain: "news-8eabc.firebaseapp.com",
            projectId: "news-8eabc",
            storageBucket: "news-8eabc.appspot.com",
            messagingSenderId: "274111285729",
            appId: "1:274111285729:web:c13b3a5ed511776af2eaa0",
            measurementId: "G-ZLR0FJ46LG"));
  } else {
    await Firebase.initializeApp();
  }
}
