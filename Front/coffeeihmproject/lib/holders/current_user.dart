import '../Services/auth/api_controller/auth_user.dart';

class CurrentUser {
  
  AuthUser currentuser;
  static final _shared = CurrentUser._sharedInstance(
      const AuthUser(token: "", userId: 0, userName: "", userEmail: ""));
  CurrentUser._sharedInstance(this.currentuser);
  factory CurrentUser() => _shared;

  void setUser(AuthUser user) {
    currentuser = user;
  }
  AuthUser getUser() {
    return  currentuser;
  }
}
