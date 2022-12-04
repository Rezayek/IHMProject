import 'package:coffeeihmproject/Services/auth/api_controller/auth_user.dart';

import 'auth_provider.dart';
import 'dart:developer' as debug;

class APIProvider implements AuthProvider {
  @override
  Future<AuthUser> signUp(
      {required String name,
      required String email,
      required String password,
      required String birthday,
      required String phoneNumber}) async {
    // ignore: todo
    // TODO: implement SignUp
    debug.log("SignUp $name");
    throw UnimplementedError();
  }

  @override
  // ignore: todo
  // TODO: implement currentUser
  AuthUser? get currentUser => null;

  @override
  Future<AuthUser> logIn(
      {required String email, required String password}) async {
    // ignore: todo
    // TODO: implement logIn
    debug.log("Login $email");
    return  AuthUser.fromAPI({
      'userId': "000001",
      'userName': "ahemd",
      'userEmail':"ahmed@gmail.com"

    });
  }

  @override
  Future<void> logOut() async {
    // ignore: todo
    // TODO: implement logOut
    debug.log("Logout");
    throw UnimplementedError();
  }
}
