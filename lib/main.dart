import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tirutsava/screens/splash.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
// import '/screens/uploadpage.dart';
// import '/screens/gallery.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD1jMqjJt0L8VacKD8pc9fSCiZgXW8pweM",
      authDomain: "tirutsava-almanest.firebaseapp.com",
      projectId: "tirutsava-almanest",
      storageBucket: "tirutsava-almanest.firebasestorage.app",
      messagingSenderId: "590106149140",
      appId: "1:590106149140:web:e3ca38d093c2bd28194201",
      measurementId: "G-6GCVXNRJST"
    ),
  );
    if (kIsWeb && (defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.windows || defaultTargetPlatform == TargetPlatform.linux)) {
    runApp(DesktopBlockedApp());
  } else {
    runApp(MyApp());
  }
  //runApp(MyApp());
}

class DesktopBlockedApp extends StatelessWidget {
  const DesktopBlockedApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("This can only be opened in mobile devices."),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      
    );
  }
}
