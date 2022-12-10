import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String token;
  final int userId;
  final String userName;
  final String userEmail;

  const AuthUser(
      { required this.token, required this.userId, required this.userName, required this.userEmail});

  factory AuthUser.fromAPI(Map<String, dynamic> snapshot) => AuthUser(
      token: snapshot['data']['token'],
      userId: snapshot['data']['user_id'],
      userName: snapshot['data']['name'],
      userEmail: snapshot['data']['email']);
}
