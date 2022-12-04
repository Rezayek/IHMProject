import 'package:flutter/foundation.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class AuthEventLogIn extends AuthEvent {
  final String email;
  final String password;

  const AuthEventLogIn(this.email, this.password);
}

class AuthEventShouldSignUp extends AuthEvent {
  const AuthEventShouldSignUp();
}

class AuthEventSignUp extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String birthday;
  final String phone;

  const AuthEventSignUp(
    this.name,
    this.email,
    this.password,
    this.birthday,
    this.phone,
  );
}

class AuthEventLogOut extends AuthEvent {
  const AuthEventLogOut();
}
