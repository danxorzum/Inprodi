import "dart:developer";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:inprodi/repositories/clients/clients_model.dart";
import 'package:inprodi/repositories/clients/clients_repository.dart';
import 'clients_podo.dart';

class _ClientsNotifier extends StateNotifier<ClientsState> {
  _ClientsNotifier() : super(ClientsState());

  Future getClients() async {
    try {
      final List<ClientModel>? newClients =
          await ClientsRepository().getClients();

      state = state.fromPrevious(clients: newClients);
    } catch (err) {}
  }
}

final clientProvider = StateNotifierProvider<_ClientsNotifier, ClientsState>(
    (ref) => _ClientsNotifier());
