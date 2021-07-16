import 'package:inprodi/repositories/auth/auth_model.dart';

class AuthState {
  bool loggedIn;
  UserModel? userModel;

  AuthState({
    this.userModel,
    this.loggedIn = false,
  });

  AuthState fromPrevious({
    UserModel? userModel,
    bool? loggedIn,
  }) =>
      AuthState(
          userModel: userModel != null ? userModel : this.userModel,
          loggedIn: loggedIn != null ? loggedIn : this.loggedIn);
}
