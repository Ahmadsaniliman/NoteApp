import 'package:login/services/auth/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;

  Future<AuthUser> createUser({
    required String email,
    required String password,
  });

  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> sendEmailVerification();
}
