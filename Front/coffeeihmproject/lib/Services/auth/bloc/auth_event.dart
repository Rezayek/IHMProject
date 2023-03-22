import 'package:flutter/foundation.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventUnInitialize extends AuthEvent {
  const AuthEventUnInitialize();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class AuthEventLogIn extends AuthEvent {
  final String email;
  final String password;

  const AuthEventLogIn(this.email, this.password);
}

class AuthEventLogOut extends AuthEvent {
  const AuthEventLogOut();
}

class AuthEventSendEmailVerification extends AuthEvent {
  const AuthEventSendEmailVerification();
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

class AuthEventShouldRegister extends AuthEvent {
  const AuthEventShouldRegister();
}

class AuthEventForgotPassword extends AuthEvent {
  final String? email;

  const AuthEventForgotPassword({this.email});
}

class AddProductSEvent extends AuthEvent {
  final String itemId;
  final String itemName;
  final String itemCost;
  final int itemQte;
  final String itemImg;
  const AddProductSEvent({
    required this.itemId,
    required this.itemName,
    required this.itemCost,
    required this.itemQte,
    required this.itemImg,
  });
}
