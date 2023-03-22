import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeihmproject/Services/auth/user_cloud/user_cloud_exception.dart';

import 'user_data.dart';


class UserDataFirebase {
  final users = FirebaseFirestore.instance.collection('Users');

  //signleton-------------------------------------------

  static final _shared = UserDataFirebase._sharedInstance();
  UserDataFirebase._sharedInstance();
  factory UserDataFirebase() => _shared;
  //----------------------------------------------------

  Future<void> creatNewUserData({
    required String userId,
    required String name,
    required String email,
    required String birth,
    required String phoneNumber
  }) async {
    await users.add({
      'user_id': userId,
      'name': name,
      'email': email,
      'birthday': birth,
      'phone_ number': phoneNumber,
      'rank': 0,
      'token': 0,
      'image_url': '',
    });
  }

  Future<List<UserData>> getUserData({required String userAcountId}) async {
    try {
      
      final usersData = await users
          .where(
            'user_id',
            isEqualTo: userAcountId,
          )
          .get()
          .then(
            (value) =>
                value.docs.map((doc) => UserData.fromSnapshot(doc)).toList(),
          );
      return usersData ;
    } catch (e) {
      throw CouldNotFoundUserDataException();
    }
  }
}
