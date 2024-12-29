import 'package:banking_app2/core/utils/dependency_injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckState {
  CheckState._(); 
static final FirebaseAuth _firebaseAuth = locator.get<FirebaseAuth>();
  /// Listens to authentication state changes and logs the current state.
  static void monitorAuthState() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('===== User is currently signed out! =====');
      } else {
        debugPrint('===== User is signed in! =====');
      }
    });
  }

  /// Checks if the user is signed in and if their email is verified.
  static Future<bool> isUserSignedIn() async {
    User? user = _firebaseAuth.currentUser;

    if (user != null) {
      // print("Email Verified: ${user.emailVerified}");
      return user.emailVerified;
    }
    return false; // Not signed in
  }
}


// class CheckState {
//   static Future<bool> isUserSignedIn() async {
//     User? user = FirebaseAuth.instance.currentUser;

//     // Check if the user is signed in
//     if (user != null) {
//       // Check if the user's email is verified
//       return user.emailVerified;
//     }
//     return false; // Not signed in
//   }
// }
