import 'package:nine_ja_hotel/core/models/login_entity_model.dart';
import 'package:nine_ja_hotel/core/models/login_response_model/login_response_model.dart';
import 'package:nine_ja_hotel/core/source/source.dart';

import '../network/api_path.dart';
import '../network/network_service.dart';

class AuthSourceImpl implements AuthSource {
  final NetworkService _networkService;

  AuthSourceImpl({required NetworkService networkService})
    : _networkService = networkService;

  @override
  Future<LoginResponseModel?> login(LoginEntityModel entity) async {
    final response = await _networkService.request(
      path: ApiPath.login,
      requestType: RequestType.post,
      data: entity.toJson(),
    );
    return LoginResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

}
