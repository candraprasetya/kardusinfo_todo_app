import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository{
  Future<User?> getCurrentUser();
  Future<void> signInUser(String email, String password);
  Future<void> signOutUser();
  Future<void> signUpUser(String email, String password);
}