import 'package:nine_ja_hotel/core/models/login_entity_model.dart';
import 'package:nine_ja_hotel/core/models/login_response_model/login_response_model.dart';

import '../app_logger.dart';
import '../repository/repository.dart';
import '../session_manager.dart';

class AuthServiceImpl implements AuthRepository {
  final AuthRepository _authRepository;
  final _logger = getLogger('AuthServiceImpl');

  AuthServiceImpl({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<LoginResponseModel?> login(LoginEntityModel entity) async {
    try {
      final user =
          await _authRepository.login(entity);

      session.accessToken = user?.data?.token ?? '';

      return user;
    } catch (e) {
      _logger.e(e.toString());
      rethrow;
    }
  }

}