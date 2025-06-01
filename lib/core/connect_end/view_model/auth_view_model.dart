// ignore_for_file: collection_methods_unrelated_type

import 'package:flutter/material.dart';
import 'package:nine_ja_hotel/core/connect_end/model/set_unavailable_entity_model.dart';
import 'package:nine_ja_hotel/core/core_folder/app/app.router.dart';
import 'package:nine_ja_hotel/main.dart';
import 'package:stacked/stacked.dart';
import '../../../screens/app_utils.dart';
import '../../core_folder/app/app.logger.dart';
import '../model/get_stat_response_model/get_stat_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/make_hall_available_response_model/make_hall_available_response_model.dart';
import '../model/make_room_available_response_model/make_room_available_response_model.dart';
import '../model/user_profile_response_model/user_profile_response_model.dart';
import '../repo/repo_implementation.dart';

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('AuthViewModel');

  final repositoryImply = AuthRepoImpl();
  // final session = locator<SharedPreferencesService>();

  AuthViewModel({this.context});

  bool get isLoading => _isLoading;
  bool _isLoading = false;

  LoginResponseModel? get loginResponse => _loginResponse;
  LoginResponseModel? _loginResponse;
  UserProfileResponseModel? get profileResponseModel => _profileResponseModel;
  UserProfileResponseModel? _profileResponseModel;

  GetStatResponseModel? get getStatResponseModel => _getStatResponseModel;
  GetStatResponseModel? _getStatResponseModel;

  MakeRoomAvailableResponseModel? get makeRoomAvailableResponseModel =>
      _makeRoomAvailableResponseModel;
  MakeRoomAvailableResponseModel? _makeRoomAvailableResponseModel;
  MakeHallAvailableResponseModel? get makeHallAvailableResponseMode =>
      _makeHallAvailableResponseModel;
  MakeHallAvailableResponseModel? _makeHallAvailableResponseModel;

  // login flow so api call for method can be called here

  Future<void> loginUser({LoginEntityModel? loginEntity, contxt}) async {
    try {
      _isLoading = true;
      _loginResponse = await runBusyFuture(
        repositoryImply.login(loginEntity!),
        throwException: true,
      );

      if (_loginResponse?.success == true) {
        _isLoading = false;
        await AppUtils.snackbar(
          contxt,
          message: _loginResponse?.message!.toString(),
        );
        navigate.navigateTo(Routes.dashboard);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> userProfile({contxt}) async {
    try {
      _isLoading = true;
      _profileResponseModel = await runBusyFuture(
        repositoryImply.userProfile(),
        throwException: true,
      );

      if (_profileResponseModel?.success == true) {
        _isLoading = false;
        await AppUtils.snackbar(
          contxt,
          message: _profileResponseModel?.message!.toString(),
        );
        // navigate.navigateTo(Routes.dashboard);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getStats({contxt}) async {
    try {
      _isLoading = true;
      _getStatResponseModel = await runBusyFuture(
        repositoryImply.getStats(),
        throwException: true,
      );

      if (_getStatResponseModel?.success == true) {
        _isLoading = false;
        await AppUtils.snackbar(
          contxt,
          message: _getStatResponseModel?.message!.toString(),
        );
        // navigate.navigateTo(Routes.dashboard);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAllRooms({contxt, String? date}) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.getAllRooms(date!),
        throwException: true,
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAllHalls({contxt, String? date}) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.getAllHalls(date!),
        throwException: true,
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> roomCategory({contxt}) async {
    try {
      _isLoading = true;
      await runBusyFuture(repositoryImply.roomCategory(), throwException: true);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> makeRoomAvailable({contxt, String? id}) async {
    try {
      _isLoading = true;
      _makeRoomAvailableResponseModel = await runBusyFuture(
        repositoryImply.makeRoomAvailable(id!),
        throwException: true,
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> makeHallAvailable({contxt, String? id}) async {
    try {
      _isLoading = true;
      _makeHallAvailableResponseModel = await runBusyFuture(
        repositoryImply.makeHallAvailable(id!),
        throwException: true,
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> makeHallUnAvailable({
    contxt,
    String? id,
    SetUnavailableEntityModel? unavailable,
  }) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.makeHallUnAvailable(id: id!, unavailable: unavailable),
        throwException: true,
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> allBookings({contxt}) async {
    try {
      _isLoading = true;
      await runBusyFuture(repositoryImply.allBookings(), throwException: true);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> todaysBookings({contxt}) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.todaysBooking(),
        throwException: true,
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }
}
