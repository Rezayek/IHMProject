import 'package:coffeeihmproject/Services/auth/api_controller/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;

  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser> signUp({
    required String name,
    required String email,
    required String password,
    required String birthday,
    required String phoneNumber,
  });

  Future<void> logOut();
}
