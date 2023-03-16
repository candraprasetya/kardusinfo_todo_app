import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  final _authInstance = FirebaseAuth.instance;

  // check is user loggedIn
  bool isUserLoggedIn() {
    return _authInstance.currentUser != null ? true : false;
  }

  // get user
  User? getUser() {
    return _authInstance.currentUser;
  }

  // user state changed
  Stream<User?> get userState => _authInstance.authStateChanges();

  // sign in
  Future<bool> signIn(String email, String password) async {
    try {
      await _authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  // sign out
  Future<void> signOut() async {
    try {
      await _authInstance.signOut();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  // sign up
  Future<void> signUp(String email, String password) async {
    try {
      await _authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  // forgot password
  Future<void> forgotPassword(String email) async {
    try {
      await _authInstance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  // signout
  Future<void> signOutUser() async {
    try {
      await _authInstance.signOut();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }
}
