import 'package:nine_ja_hotel/core/models/login_entity_model.dart';
import 'package:nine_ja_hotel/core/models/login_response_model/login_response_model.dart';

abstract class AuthRepository {
  Future<LoginResponseModel?> login(LoginEntityModel entity);
}