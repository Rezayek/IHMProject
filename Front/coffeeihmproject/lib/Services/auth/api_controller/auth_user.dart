import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String userId;
  final bool isEmailVerified;
  final String userEmail;

  const AuthUser(
      { required this.userId, required this.isEmailVerified, required this.userEmail});

  factory AuthUser.fromAPI(User user) => AuthUser(
        userEmail: user.email!,
        isEmailVerified: user.emailVerified,
        userId: user.uid,
      );
}
