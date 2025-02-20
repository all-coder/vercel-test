import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthentication {
  String phoneNumber = "";

  Future<ConfirmationResult> sendOTP(String phoneNumber) async {
    this.phoneNumber = phoneNumber;
    FirebaseAuth auth = FirebaseAuth.instance;

    ConfirmationResult confirmationResult =
        await auth.signInWithPhoneNumber('+91$phoneNumber');

    printMessage("OTP Sent to +91$phoneNumber");
    return confirmationResult;
  }

  Future<void> authenticateMe(
      ConfirmationResult confirmationResult, String otp) async {
    UserCredential userCredential = await confirmationResult.confirm(otp);
    printMessage(userCredential.additionalUserInfo!.isNewUser
        ? "Successful Authentication"
        : "User already exists");
  }

  void printMessage(String msg) {
    debugPrint(msg);
  }
}
