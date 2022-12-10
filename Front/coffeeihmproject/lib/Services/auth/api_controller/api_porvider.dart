import 'dart:convert';

import 'package:coffeeihmproject/Services/auth/api_controller/auth_user.dart';

import '../../../constants/host.dart';
import '../../../holders/current_user.dart';
import '../../data_services/best_offer_bloc/data_bloc.dart';
import 'auth_provider.dart';
import 'dart:developer' as debug;
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class APIProvider implements AuthProvider {
  @override
  Future<AuthUser> signUp(
      {required String name,
      required String email,
      required String password,
      required String birthday,
      required String phoneNumber}) async {
    // ignore: todo
    // TODO: implement SignUp
    //Auth : 'Authorization':'Bearer 1|hYqQAM2NdTUOFquYjPWdOQlC9fxv7biDJlOTPBlk'
    late final http.Response response;
    var user =
        const AuthUser(token: "", userId: 0, userName: "", userEmail: "");
    try {
      response = await http.post(
        Uri.parse('$url/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'password': password,
          'birthday': birthday,
          'phoneNumber': phoneNumber,
        }),
      );
      if (response.statusCode == 200) {
        debug.log(response.body);
        user =  AuthUser.fromAPI(jsonDecode(response.body));
      } else {
        debug.log('Failed to crete');
      }
    } catch (e) {
      debug.log('Failed to create exception $e');
    }
    return user;
  }

  @override
  // ignore: todo
  // TODO: implement currentUser
  AuthUser? get currentUser => null;

  @override
  Future<AuthUser> logIn(
      {required String email, required String password}) async {
    // ignore: todo
    // TODO: implement logIn
    late final http.Response response;
    var user =
        const AuthUser(token: "", userId: 0, userName: "", userEmail: "");
    try {
      response = await http.post(
        Uri.parse('$url/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        debug.log(response.body);
        user = AuthUser.fromAPI(jsonDecode(response.body));
      } else {
        debug.log('Failed to crete');
      }
    } catch (e) {
      debug.log('Failed to create exception $e');
    }    
    return user;
  }

  @override
  Future<void> logOut() async {
    // ignore: todo
    // TODO: implement logOut
    debug.log("Logout");
  }
}
