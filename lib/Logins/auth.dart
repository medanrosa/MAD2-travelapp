import 'dart:developer'; // Import this package for logging

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(
      String username,
      String password,
      ) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
      return cred.user;
    } catch (e) {
      // Log the specific error message
      log("Error creating user: $e");
      return null;
    }
  }

  Future<User?> loginWithUserWithEmailAndPassword(
      String username,
      String password,
      ) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      return cred.user;
    } catch (e) {
      // Log the specific error message
      log("Error logging in: $e");
      return null;
    }
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      // Log the specific error message
      log("Error signing out: $e");
    }
  }
}
