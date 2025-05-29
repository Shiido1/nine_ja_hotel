
import '../models/login_entity_model.dart';

enum AuthStatus { initial, loading, success, error }

class AuthState {
  final AuthStatus status;
  final String? error;
  final LoginEntityModel? user;

  const AuthState({
    this.status = AuthStatus.initial,
    this.error,
    this.user,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? error,
    LoginEntityModel? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      error: error,
      user: user ?? this.user,
    );
  }
}
