// lib/features/auth/application/auth_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nine_ja_hotel/core/models/login_entity_model.dart';
import 'package:nine_ja_hotel/core/state/auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(const AuthState());

  Future<void> login(LoginEntityModel entity) async {
    state = state.copyWith(status: AuthStatus.loading);

    await Future.delayed(Duration(seconds: 2)); // Simulated API call

    // ignore: unnecessary_null_comparison
    if (entity!=null) {
      state = AuthState(
        status: AuthStatus.success,
        user: LoginEntityModel(email: entity.email, password: entity.password),
      );
    } else {
      state = state.copyWith(
        status: AuthStatus.error,
        error: "Invalid credentials",
      );
    }
  }

  void logout() {
    state = const AuthState();
  }
}

final authProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController();
});
