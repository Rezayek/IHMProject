import 'package:coffeeihmproject/Services/auth/api_controller/auth_provider.dart';
import 'package:coffeeihmproject/Services/auth/api_controller/auth_user.dart';

import 'api_porvider.dart';

class AuthServices implements AuthProvider {
  final AuthProvider provider;
  const AuthServices(this.provider);

  factory AuthServices.getAPI() => AuthServices(APIProvider());
  @override
  Future<AuthUser> signUp(
          {required String name,
          required String email,
          required String password,
          required String birthday,
          required String phoneNumber}) =>
      provider.signUp(
          name: name,
          email: email,
          password: password,
          birthday: birthday,
          phoneNumber: phoneNumber);

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({required String email, required String password}) =>
      provider.logIn(email: email, password: password);

  @override
  Future<void> logOut() => provider.logOut();
}
