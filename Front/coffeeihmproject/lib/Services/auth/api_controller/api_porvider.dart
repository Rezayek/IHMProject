import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffeeihmproject/Services/auth/api_controller/auth_user.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../constants/host.dart';
import '../../../firebase_options.dart';
import '../../../holders/current_user.dart';
import '../user_cloud/user_data_firebase.dart';
import 'auth_exception.dart';
import 'auth_provider.dart';
import 'dart:developer' as debug;

import 'package:http/http.dart' as http;

class APIProvider implements AuthProvider {

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  
  @override
  Future<AuthUser> signUp(
      {required String name,
      required String email,
      required String password,
      required String birthday,
      required String phoneNumber}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        UserDataFirebase userDataStorage = UserDataFirebase();
        await userDataStorage.creatNewUserData(
            birth: birthday,
            email: email,
            name: name,
            phoneNumber: phoneNumber,
            userId: user.userId);
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseAuthException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return AuthUser.fromAPI(user);
    }
    return null;
  }

  @override
  Future<AuthUser> logIn(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = currentUser;
      if (user != null) {
        UserDataFirebase userDataStorage = UserDataFirebase();
        final userData =await userDataStorage.getUserData(userAcountId: user.userId);
        CurrentUser().setUser(userData.first);
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logOut() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }
}
