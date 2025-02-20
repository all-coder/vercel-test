import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

class FirebaseAuthentication {
  String phoneNumber = "";
  
  Future<ConfirmationResult> sendOtp(String phoneNumber) async {
    this.phoneNumber = phoneNumber;
    FirebaseAuth auth = FirebaseAuth.instance;
    
    ConfirmationResult result = await auth.signInWithPhoneNumber(
      '+91 $phoneNumber',
      RecaptchaVerifier(
        auth: FirebaseAuthPlatform.instance,
        container: 'recaptcha-container',
        size: RecaptchaVerifierSize.compact, // or normal
        onSuccess: () {
          print('reCAPTCHA Completed!');
        },
        onError: (error) {
          print('reCAPTCHA error: $error');
        },
        onExpired: () {
          print('reCAPTCHA expired!');
        },
      ),
    );
    print("OTP sent to $phoneNumber");
    return result;
  }
  
  Future<void> authenticateMe(ConfirmationResult confirmationResult, String otp) async {
    UserCredential userCredential = await confirmationResult.confirm(otp);
    userCredential.additionalUserInfo!.isNewUser 
      ? print("New User")
      : print("Existing User");
  }
}
