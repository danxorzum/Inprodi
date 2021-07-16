import 'package:http/http.dart' as http;

import 'clients_model.dart';

class ClientsRepository {
  Future<List<ClientModel>> getClients() async {
    List<ClientModel> clients = [];
    final resp = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
    );
    final _clients = clientModelFromJson(resp.body);
    clients.addAll(_clients);
    return clients;
  }
}
