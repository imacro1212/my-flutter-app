import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAOdRTOjhVgKtTDpMFNs-Ozss0l6xQfjl8",
            authDomain: "cleancar-5edff.firebaseapp.com",
            projectId: "cleancar-5edff",
            storageBucket: "cleancar-5edff.firebasestorage.app",
            messagingSenderId: "1029850709039",
            appId: "1:1029850709039:web:1e44cf6d9fbf5935b3dada",
            measurementId: "G-KVQ2KR82KN"));
  } else {
    await Firebase.initializeApp();
  }
}
