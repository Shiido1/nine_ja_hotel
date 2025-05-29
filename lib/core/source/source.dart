import 'package:nine_ja_hotel/core/models/login_response_model/login_response_model.dart';

import '../models/login_entity_model.dart';

abstract class AuthSource {
  Future<LoginResponseModel?> login(LoginEntityModel entity);
}
