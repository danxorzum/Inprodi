import 'package:inprodi/repositories/clients/clients_model.dart';

class ClientsState {
  List<ClientModel>? clients;
  ClientsState({this.clients});

  ClientsState fromPrevious({List<ClientModel>? clients}) => ClientsState(
      clients: clients != null && clients.isNotEmpty
          ? [...(this.clients ?? []), ...clients]
          : this.clients);
}
