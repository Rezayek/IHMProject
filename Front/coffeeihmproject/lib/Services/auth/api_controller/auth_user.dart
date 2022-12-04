import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String userId;
  final String userName;
  final String userEmail;

  const AuthUser(
      {required this.userId, required this.userName, required this.userEmail});

  factory AuthUser.fromAPI(Map<String, dynamic> snapshot) =>
      AuthUser(userId: snapshot['userId'], userName: snapshot['userName'], userEmail: snapshot['userEmail']);
}
