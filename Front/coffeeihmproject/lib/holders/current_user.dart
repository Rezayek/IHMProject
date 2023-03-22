import 'package:coffeeihmproject/Services/auth/user_cloud/user_data.dart';



class CurrentUser {
  
  late UserData currentuser;
  static final _shared = CurrentUser._sharedInstance();
  CurrentUser._sharedInstance();
  factory CurrentUser() => _shared;

  void setUser(UserData user) {
    currentuser = user;
  }
  UserData getUser() {
    return  currentuser;
  }
}
