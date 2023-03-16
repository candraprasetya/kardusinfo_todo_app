import 'package:firebase_auth/firebase_auth.dart';
import 'package:kardusinfo_todo_app/domain/repository/user_repository.dart';

class UserRepositoryImplementation implements UserRepository {
  @override
  Future<void> signInUser(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOutUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> signUpUser(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<User?> getCurrentUser() {
    throw UnimplementedError();
  }
}
