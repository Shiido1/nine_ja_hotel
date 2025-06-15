import 'package:injectable/injectable.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/get_all_booking_response_model/get_all_booking_response_model.dart';
import '../model/get_all_halls_response_model/get_all_halls_response_model.dart';
import '../model/get_all_room_response_model/get_all_room_response_model.dart';
import '../model/get_room_category_response_model/get_room_category_response_model.dart';
import '../model/get_stat_response_model/get_stat_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/make_hall_available_response_model/make_hall_available_response_model.dart';
import '../model/make_room_available_response_model/make_room_available_response_model.dart';
import '../model/set_room_all_unavailable_response_model/set_room_all_unavailable_response_model.dart';
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
  Future<GetAllRoomResponseModel> getAllRooms(String date) async =>
      await _api.getAllRooms(date);
  Future<GetAllHallsResponseModel> getAllHalls(String date) async =>
      await _api.getAllHalls(date);
  Future<GetRoomCategoryResponseModel> roomCategory() async =>
      await _api.roomCategory();
  Future<MakeRoomAvailableResponseModel> makeRoomAvailable(String id) async =>
      await _api.makeRoomAvailable(id);
  Future<MakeHallAvailableResponseModel> makeHallAvailable(String id) async =>
      await _api.makeHallAvailable(id);
  Future<MakeHallAvailableResponseModel> makeHallUnAvailable({
    String? id,
    SetUnavailableEntityModel? unavailable,
  }) async => await _api.makeHallUnAvailable(id: id, unavailable: unavailable);
  Future<SetRoomAllUnavailableResponseModel> makeRoomUnAvailable({
    String? id,
    SetUnavailableEntityModel? unavailable,
  }) async => await _api.makeRoomUnAvailable(id: id, unavailable: unavailable);
  Future<GetAllBookingResponseModel> allBookings() async =>
      await _api.allBookings();
  Future<dynamic> todaysBookings() async => await _api.todaysBookings();
}
