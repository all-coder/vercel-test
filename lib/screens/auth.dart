import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tirutsava/screens/interests.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String? name, imageUrl, userEmail, uid;

  Future<void> signInWithGoogle() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      // Sign in with Google for Web
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
      final User? user = userCredential.user;

      if (user != null) {
        uid = user.uid;
        name = user.displayName;
        userEmail = user.email;
        imageUrl = user.photoURL;

        // Save authentication state
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('auth', true);

        debugPrint("Google Sign-In Successful");
        debugPrint("Name: $name");
        debugPrint("Email: $userEmail");
        debugPrint("Image URL: $imageUrl");

        // Navigate to the next screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Interest()),
        );
      }
    } catch (e) {
      debugPrint("Google Sign-In Failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  "lib/assets/images/tirutsava_logo.png",
                  height: 100,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 80),
              Center(
                child: Text(
                  'Just a few lines away from the fun!',
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: signInWithGoogle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign In with Google',
                    style: GoogleFonts.spaceGrotesk(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
