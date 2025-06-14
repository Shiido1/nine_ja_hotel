import 'package:injectable/injectable.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preferance.dart';
import '../contract/contract_implementation.dart';
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
class AuthRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<AuthContractsImpl>();

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }

  Future<LoginResponseModel> login(LoginEntityModel loginEntityModel) async {
    final response = await _contract.login(loginEntityModel);
    _session.isLoggedIn = true;
    _chache(response.data);
    return response;
  }

  Future<UserProfileResponseModel> userProfile() async {
    final response = await _contract.userProfile();
    return response;
  }

  Future<GetStatResponseModel> getStats() async {
    final response = await _contract.getStats();
    return response;
  }

  Future<GetAllRoomResponseModel> getAllRooms(String date) async {
    final response = await _contract.getAllRooms(date);
    return response;
  }

  Future<GetAllHallsResponseModel> getAllHalls(String date) async {
    final response = await _contract.getAllHalls(date);
    return response;
  }

  Future<GetRoomCategoryResponseModel> roomCategory() async {
    final response = await _contract.roomCategory();
    return response;
  }

  Future<MakeRoomAvailableResponseModel> makeRoomAvailable(String id) async {
    final response = await _contract.makeRoomAvailable(id);
    return response;
  }

  Future<MakeHallAvailableResponseModel> makeHallAvailable(String id) async {
    final response = await _contract.makeHallAvailable(id);
    return response;
  }

  Future<dynamic> makeHallUnAvailable({
    String? id,
    SetUnavailableEntityModel? unavailable,
  }) async {
    final response = await _contract.makeHallUnAvailable(
      id: id,
      unavailable: unavailable,
    );
    return response;
  }
  
  Future<SetRoomAllUnavailableResponseModel> makeRoomUnAvailable({
    String? id,
    SetUnavailableEntityModel? unavailable,
  }) async {
    final response = await _contract.makeRoomUnAvailable(
      id: id,
      unavailable: unavailable,
    );
    return response;
  }

  Future<GetAllBookingResponseModel> allBookings() async {
    final response = await _contract.allBookings();
    return response;
  }

  Future<dynamic> todaysBooking() async {
    final response = await _contract.todaysBookings();
    return response;
  }
}
