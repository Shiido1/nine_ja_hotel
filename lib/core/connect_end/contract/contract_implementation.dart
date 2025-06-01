import 'package:injectable/injectable.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/get_stat_response_model/get_stat_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/make_hall_available_response_model/make_hall_available_response_model.dart';
import '../model/make_room_available_response_model/make_room_available_response_model.dart';
import '../model/set_unavailable_entity_model.dart';
import '../model/user_profile_response_model/user_profile_response_model.dart';

@lazySingleton
class AuthContractsImpl {
  final _api = locator<AuthApi>();

  Future<LoginResponseModel> login(LoginEntityModel loginEntityModel) async =>
      await _api.login(loginEntityModel);

  Future<UserProfileResponseModel> userProfile() async =>
      await _api.userProfile();
  Future<GetStatResponseModel> getStats() async => await _api.getStats();
  Future<dynamic> getAllRooms(String date) async =>
      await _api.getAllRooms(date);
  Future<dynamic> getAllHalls(String date) async =>
      await _api.getAllHalls(date);
  Future<dynamic> roomCategory() async => await _api.roomCategory();
  Future<MakeRoomAvailableResponseModel> makeRoomAvailable(String id) async =>
      await _api.makeRoomAvailable(id);
  Future<MakeHallAvailableResponseModel> makeHallAvailable(String id) async =>
      await _api.makeHallAvailable(id);
  Future<dynamic> makeHallUnAvailable({
    String? id,
    SetUnavailableEntityModel? unavailable,
  }) async => await _api.makeHallUnAvailable(id: id, unavailable: unavailable);
  Future<dynamic> allBookings() async => await _api.allBookings();
  Future<dynamic> todaysBookings() async => await _api.todaysBookings();
}
