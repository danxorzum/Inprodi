import 'package:flutter/cupertino.dart';
import 'package:inprodi/models/user_model.dart';
import 'package:inprodi/services/db_service.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  Future<bool> logIn(String email, String pass) async {
    final UserModel? log = await DBService.db.logIn(email, pass);

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
