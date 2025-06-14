import 'package:injectable/injectable.dart';
import 'package:nine_ja_hotel/core/connect_end/model/get_all_booking_response_model/get_all_booking_response_model.dart';
import 'package:nine_ja_hotel/core/connect_end/model/get_all_halls_response_model/get_all_halls_response_model.dart';
import 'package:nine_ja_hotel/core/connect_end/model/get_all_room_response_model/get_all_room_response_model.dart';
import 'package:nine_ja_hotel/core/connect_end/model/get_room_category_response_model/get_room_category_response_model.dart';
import 'package:nine_ja_hotel/core/connect_end/model/get_stat_response_model/get_stat_response_model.dart';
import 'package:nine_ja_hotel/core/connect_end/model/make_room_available_response_model/make_room_available_response_model.dart';
import 'package:nine_ja_hotel/core/connect_end/model/set_unavailable_entity_model.dart';
import 'package:nine_ja_hotel/core/connect_end/model/user_profile_response_model/user_profile_response_model.dart';
import '../connect_end/model/login_entity_model.dart';
import '../connect_end/model/login_response_model/login_response_model.dart';
import '../connect_end/model/make_hall_available_response_model/make_hall_available_response_model.dart';
import '../connect_end/model/set_room_all_unavailable_response_model/set_room_all_unavailable_response_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class AuthApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('AuthViewModel');

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.login,
        RequestMethod.post,
        data: loginEntity.toJson(),
      );
      logger.d(response.data);
      return LoginResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<UserProfileResponseModel> userProfile() async {
    try {
      final response = await _service.call(
        UrlConfig.profile,
        RequestMethod.get,
      );
      logger.d(response.data);
      return UserProfileResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetStatResponseModel> getStats() async {
    try {
      final response = await _service.call(UrlConfig.stats, RequestMethod.get);
      logger.d(response.data);
      return GetStatResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAllRoomResponseModel> getAllRooms(String date) async {
    try {
      final response = await _service.call(
        UrlConfig.rooms,
        RequestMethod.getParams,
        queryParams: {'date': date},
      );
      logger.d(response.data);
      return GetAllRoomResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAllHallsResponseModel> getAllHalls(String date) async {
    try {
      final response = await _service.call(
        UrlConfig.halls,
        RequestMethod.get,
        queryParams: {'date': date},
      );
      logger.d(response.data);
      return GetAllHallsResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetRoomCategoryResponseModel> roomCategory() async {
    try {
      final response = await _service.call(
        UrlConfig.room_categories,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetRoomCategoryResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<MakeRoomAvailableResponseModel> makeRoomAvailable(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.room}/$id',
        RequestMethod.patch,
      );
      logger.d(response.data);
      return MakeRoomAvailableResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<MakeHallAvailableResponseModel> makeHallAvailable(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.room}/$id',
        RequestMethod.patch,
      );
      logger.d(response.data);
      return MakeHallAvailableResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SetRoomAllUnavailableResponseModel> makeRoomUnAvailable({
    String? id,
    SetUnavailableEntityModel? unavailable,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.room}/$id/set-unavailability',
        RequestMethod.patch,
        data: unavailable?.toJson(),
      );
      logger.d(response.data);
      return SetRoomAllUnavailableResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> makeHallUnAvailable({
    String? id,
    SetUnavailableEntityModel? unavailable,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.hall}/$id/set-unavailability',
        RequestMethod.patch,
        data: unavailable?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAllBookingResponseModel> allBookings() async {
    try {
      final response = await _service.call(
        UrlConfig.bookings,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetAllBookingResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> todaysBookings() async {
    try {
      final response = await _service.call(
        UrlConfig.todays_bookings,
        RequestMethod.get,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
