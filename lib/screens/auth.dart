import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tirutsava/screens/interests.dart';
import 'package:tirutsava/services/auth_service.dart'; // Your backend file
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _codeSent = false;
  ConfirmationResult? _confirmationResult;
  final FirebaseAuthentication _firebaseAuth = FirebaseAuthentication();

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  /// Handles authentication:
  /// - First click sends OTP using the phone number.
  /// - Next click verifies the entered OTP.
  void _handleAuth() async {
    if (!_codeSent) {
      // Send OTP
      String phone = _phoneController.text.trim();
      if (phone.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter your phone number")),
        );
        return;
      }
      try {
        // Call sendOtp from your backend. Make sure it returns the ConfirmationResult.
        var result = await _firebaseAuth.sendOtp(phone);
        setState(() {
          _codeSent = true;
          _confirmationResult = result;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("OTP sent successfully!")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error sending OTP: $e")),
        );
      }
    } else {
      // Verify OTP
      String otp = _otpController.text.trim();
      if (otp.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter the OTP")),
        );
        return;
      }
      try {
        await _firebaseAuth.authenticateMe(_confirmationResult!, otp);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Phone verified successfully!")),
        );
        // Navigate to the Interests screen upon successful authentication.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Interest()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error verifying OTP: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            if (_codeSent)
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
              onPressed: _handleAuth,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Center(
                child: Text(
                  !_codeSent ? 'Send OTP' : 'Verify OTP',
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
    );
  }
}
