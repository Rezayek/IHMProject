import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class UserData {
  final String userDataId;
  final String userId;
  final String name;
  final String email;
  final String phoneNumber;
  final int rank;
  final int token;
  final String imageUrl;

  const UserData({
    required this.userDataId,
    required this.userId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.rank,
    required this.token,
    required this.imageUrl,
  });

  UserData.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : userDataId = snapshot.id,
        userId = snapshot.data()['user_id'],
        name = snapshot.data()['name'],
        email = snapshot.data()['email'],
        phoneNumber = snapshot.data()['phone_ number'],
        rank = snapshot.data()['rank'],
        token = snapshot.data()['token'],
        imageUrl = snapshot.data()['image_url'];

}
