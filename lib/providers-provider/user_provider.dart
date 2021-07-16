import 'package:flutter/cupertino.dart';

import 'package:inprodi/models/user_model.dart';
import "package:inprodi/repositories/auth/auth_repository.dart";

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  Future<bool> login(String email, String pass) async {
    final UserModel? log = await DBService.db.login(email, pass);

    if (log == null) return false;
    _user = log;
    return true;
  }

  Future<bool> register(
      String name, String email, int phone, String pass) async {
    final int regis = await DBService.db
        .newUser(name: name, email: email, pass: pass, phone: phone);

    if (regis == -1) return false;
    return true;
  }
}
