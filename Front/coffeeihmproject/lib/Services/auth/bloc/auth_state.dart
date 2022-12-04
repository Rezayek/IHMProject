import 'package:flutter/foundation.dart';

import '../api_controller/auth_user.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthStateUnInitialized extends AuthState{
  const AuthStateUnInitialized() : super();
}

class AuthStateInitialized extends AuthState{
  const AuthStateInitialized() : super();
}

class AuthStateSignUp extends AuthState{
  final Exception? exception;
  const AuthStateSignUp({required this.exception}) : super();
}
class AuthStateLoggedIn extends AuthState{
  final AuthUser user;
  const AuthStateLoggedIn({required this.user}) : super();
}
class AuthStateLoggedOut extends AuthState{
  final Exception? exception;
  const AuthStateLoggedOut({required this.exception}) : super();
}

