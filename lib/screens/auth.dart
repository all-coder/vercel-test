import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tirutsava/screens/interests.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  ConfirmationResult? _confirmationResult;
  bool _otpSent = false;

  Future<void> sendOTP() async {
    String phoneNumber = _phoneController.text.trim();
    if (phoneNumber.isEmpty) return;

    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      _confirmationResult = await auth.signInWithPhoneNumber('+91$phoneNumber');
      setState(() => _otpSent = true);
      debugPrint("OTP Sent to +91$phoneNumber");
    } catch (e) {
      debugPrint("Failed to send OTP: $e");
    }
  }

  Future<void> verifyOTP() async {
    if (_confirmationResult == null) return;

    String otp = _otpController.text.trim();
    if (otp.isEmpty) return;

    try {
      UserCredential userCredential = await _confirmationResult!.confirm(otp);
      bool isNewUser = userCredential.additionalUserInfo!.isNewUser;

      debugPrint(isNewUser ? "Successful Authentication" : "User already exists");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Interest()),
      );
    } catch (e) {
      debugPrint("OTP verification failed: $e");
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
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
              const SizedBox(height: 20),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                style: GoogleFonts.audiowide(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter your phone number',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_otpSent)
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.audiowide(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Enter your OTP',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: _otpSent ? verifyOTP : sendOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    _otpSent ? 'Verify OTP' : 'Send OTP',
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
