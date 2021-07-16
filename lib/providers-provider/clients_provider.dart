import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:inprodi/models/client_model.dart';

class ClientsProvider with ChangeNotifier {
  List<Client> clients = [];

  Future getClients() async {
    final resp = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
    );
    final _clients = clientFromJson(resp.body);
    clients.addAll(_clients);
    notifyListeners();
  }

  // bool login(String email, String pass) async {
  //   final UserModel? user = await DBService.db.login(email, pass);
  //   if (user != null) {
  //     _name = user.name;
  //     _email = user.email;
  //     _phone = user.phone;
  //     _id = user.id;
  //     return true;
  //   }
  //   return false;
  // }
}
