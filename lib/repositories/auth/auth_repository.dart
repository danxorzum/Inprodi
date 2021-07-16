import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import "package:inprodi/repositories/auth/auth_model.dart";

class AuthRepository {
  static Database? _database;
  static final AuthRepository db = AuthRepository._();

  AuthRepository._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();

    return _database;
  }

  Future<Database?> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'vezbela.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Users(
          id INTEGER PRIMARY KEY,
          name TEXT,
          email TEXT UNIQUE,
          phone INTEGER,
          pass TEXT
        )
      ''');
    });
  }

  Future<int> newUser(
      {required String name,
      required String email,
      required String pass,
      required int phone}) async {
    final db = await database;
    final res = await db?.insert(
        'Users', {"name": name, "email": email, "phone": phone, "pass": pass});
    if (res == null) return -1;
    return res;
  }

  Future<UserModel?> login(String email, String pass) async {
    final db = await database;
    final res =
        await db!.rawQuery('SELECT * FROM Users WHERE email LIKE "%$email%"');

    List<_UserDB> list =
        res.isNotEmpty ? res.map((c) => _UserDB.fromJson(c)).toList() : [];
    if (list.isEmpty) return null;
    if (list[0].pass != pass) return null;

    return UserModel(list[0].id, list[0].name, list[0].email, list[0].phone);
  }

  static Future<bool> register(
      String name, String email, int phone, String pass) async {
    try {
      final int regis = await AuthRepository.db
          .newUser(name: name, email: email, pass: pass, phone: phone);

      return regis != -1;
    } catch (err) {
      return false;
    }
  }
}

class _UserDB {
  int id;
  String name;
  String email;
  int phone;
  String pass;

  _UserDB(this.id, this.name, this.email, this.phone, this.pass);

  factory _UserDB.fromJson(Map<String, dynamic> json) => _UserDB(
        json["id"],
        json["name"],
        json["email"],
        json["phone"],
        json["pass"],
      );

  Map<String, dynamic> toJson() =>
      {"name": name, "email": email, "phone": phone, "pass": pass};
}
