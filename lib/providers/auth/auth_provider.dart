import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:inprodi/repositories/auth/auth_model.dart";
import "package:inprodi/repositories/auth/auth_repository.dart";

import 'auth_podo.dart';

class _AuthNotifier extends StateNotifier<AuthState> {
  _AuthNotifier() : super(AuthState());

  Future<bool> login(String email, String pass) async {
    try {
      final UserModel? user = await AuthRepository.db.login(email, pass);

      if (user == null) return false;

      state = AuthState(userModel: user, loggedIn: true);

      return true;
    } catch (err) {
      return false;
    }
  }
}

final authProvider =
    StateNotifierProvider<_AuthNotifier, AuthState>((ref) => _AuthNotifier());
