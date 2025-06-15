// ignore_for_file: collection_methods_unrelated_type, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nine_ja_hotel/core/connect_end/model/set_unavailable_entity_model.dart';
import 'package:nine_ja_hotel/core/core_folder/app/app.router.dart';
import 'package:nine_ja_hotel/main.dart';
import 'package:nine_ja_hotel/screens/app_color.dart';
import 'package:stacked/stacked.dart';
import '../../../screens/app_utils.dart';
import '../../../screens/text_widget.dart';
import '../../core_folder/app/app.logger.dart';
import '../model/get_all_booking_response_model/get_all_booking_response_model.dart';
import '../model/get_all_halls_response_model/get_all_halls_response_model.dart';
import '../model/get_all_halls_response_model/hall.dart';
import '../model/get_all_room_response_model/get_all_room_response_model.dart';
import '../model/get_all_room_response_model/room.dart';
import '../model/get_room_category_response_model/get_room_category_response_model.dart';
import '../model/get_stat_response_model/get_stat_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/make_hall_available_response_model/make_hall_available_response_model.dart';
import '../model/make_room_available_response_model/make_room_available_response_model.dart';
import '../model/set_room_all_unavailable_response_model/set_room_all_unavailable_response_model.dart';
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
  bool get isLoadingDash => _isLoadingDash;
  bool _isLoadingDash = false;

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
  GetAllRoomResponseModel? get getAllRoomResponseModel =>
      _getAllRoomResponseModel;
  GetAllRoomResponseModel? _getAllRoomResponseModel;
  GetAllHallsResponseModel? get getAllHallsResponseModel =>
      _getAllHallsResponseModel;
  GetAllHallsResponseModel? _getAllHallsResponseModel;
  GetAllBookingResponseModel? get getAllBookingResponseModel =>
      _getAllBookingResponseModel;
  GetAllBookingResponseModel? _getAllBookingResponseModel;
  SetRoomAllUnavailableResponseModel? get setRoomAllUnavailableResponseModel =>
      _setRoomAllUnavailableResponseModel;
  SetRoomAllUnavailableResponseModel? _setRoomAllUnavailableResponseModel;
  GetRoomCategoryResponseModel? get getRoomCategoryResponseModel =>
      _getRoomCategoryResponseModel;
  GetRoomCategoryResponseModel? _getRoomCategoryResponseModel;
  DateTime now = DateTime.now();
  DateTime from = DateTime.now();
  DateTime to = DateTime.now();

  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;

  double convertNairaToDollar(
    double nairaAmount, {
    double exchangeRate = 1500.0,
  }) {
    // exchangeRate is optional: defaults to 1 USD = 1500 NGN
    return nairaAmount / exchangeRate;
  }

  selectDialog(context, {Room? room}) => PopupMenuButton<String>(
    padding: EdgeInsets.zero,
    menuPadding: EdgeInsets.zero,
    color: AppColor.white,
    onSelected: (value) {},
    icon: Card(
      elevation: 2,
      color: roomStatus(room?.isAvailable),
      margin: EdgeInsets.zero,
      child: Container(
        height: 80,
        width: 80,
        margin: EdgeInsets.only(left: 1.80),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          color: roomStatus(room?.isAvailable),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextView(
            text: room?.number ?? '',
            color: roomStatusText(room?.isAvailable),
            fontSize: 26.30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),

    itemBuilder:
        (_) => [
          room?.isAvailable == 'available'
              ? PopupMenuItem(
                value: 'unavailable',

                child: Row(
                  children: [
                    Icon(Icons.visibility_off_outlined),
                    SizedBox(width: 6.2),
                    TextView(
                      text: 'Set Unavailability',
                      color: AppColor.black,
                      fontSize: 16.30,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                onTap:
                    () => selectRoomDateAvailablibityFrom(
                      context: context,
                      id: room?.id?.toString(),
                      status: room?.isAvailable,
                    ),
              )
              : PopupMenuItem(
                value: 'available',
                child: Row(
                  children: [
                    Icon(Icons.visibility_outlined),
                    SizedBox(width: 3.2),
                    TextView(
                      text: 'Set Availability',
                      color: AppColor.black,
                      fontSize: 16.30,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                onTap:
                    () => selectRoomDateAvailablibityFrom(
                      context: context,
                      id: room?.id?.toString(),
                      status: room?.isAvailable,
                    ),
              ),
        ],
  );

  selectHallEnabilitiesDialog(context, {Hall? hall}) => PopupMenuButton<String>(
    color: AppColor.white,
    onSelected: (value) {},
    icon: Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.edit_square, color: AppColor.yellow, size: 24),
          SizedBox(width: 5.2),
          TextView(
            text: 'Edit',
            color: const Color.fromARGB(255, 72, 45, 3),
            fontSize: 18.20,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    ),
    itemBuilder:
        (_) => [
          hall?.status == 'available'
              ? PopupMenuItem(
                value: 'unavailable',

                child: Row(
                  children: [
                    Icon(Icons.visibility_off_outlined),
                    SizedBox(width: 6.2),
                    TextView(
                      text: 'Set Unavailability',
                      color: AppColor.black,
                      fontSize: 16.30,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),

                onTap:
                    () => selectHallDateAvailablibityFrom(
                      context: context,
                      id: hall?.id?.toString(),
                      status: hall?.status,
                    ),
              )
              : PopupMenuItem(
                value: 'available',
                child: Row(
                  children: [
                    Icon(Icons.visibility_outlined),
                    SizedBox(width: 3.2),
                    TextView(
                      text: 'Set Availability',
                      color: AppColor.black,
                      fontSize: 16.30,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                onTap:
                    () => selectHallDateAvailablibityFrom(
                      context: context,
                      id: hall?.id?.toString(),
                      status: hall?.status,
                    ),
              ),
        ],
  );

  bool isOnTogglePassword() {
    _isTogglePassword = !_isTogglePassword;
    notifyListeners();
    return _isTogglePassword;
  }

  Color roomStatus(status) {
    if (status == 'available') {
      return AppColor.white;
    } else if (status == 'occupied') {
      return AppColor.red;
    } else if (status == 'dirty') {
      return AppColor.brown;
    }
    return AppColor.green;
  }

  Color roomStatusText(status) {
    if (status == 'available') {
      return AppColor.black;
    } else if (status == 'occupied') {
      return AppColor.white;
    } else if (status == 'dirty') {
      return AppColor.black;
    }
    return AppColor.white;
  }

  Future<void> selectDate(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
      context: context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      now = picked;
    }
    notifyListeners();
  }

  Future<void> selectRoomDateAvailablibityFrom({
    BuildContext? context,
    String? status,
    String? id,
  }) async {
    final DateTime? picked = await showDatePicker(
      helpText: 'Select Availability from:',
      context: context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      from = picked;
      Future.delayed(Duration(seconds: 1), () {
        selectRoomDateAvailablibityTo(context: context, id: id, status: status);
      });
    }
    notifyListeners();
  }

  Future<void> selectHallDateAvailablibityFrom({
    BuildContext? context,
    String? status,
    String? id,
  }) async {
    final DateTime? picked = await showDatePicker(
      helpText: 'Select Availability from:',
      context: context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      from = picked;
      Future.delayed(Duration(seconds: 1), () {
        selectHallDateAvailablibityTo(context: context, id: id, status: status);
      });
    }
    notifyListeners();
  }

  Future<void> selectRoomDateAvailablibityTo({
    BuildContext? context,
    String? status,
    String? id,
  }) async {
    final DateTime? picked = await showDatePicker(
      helpText: 'Select Availability to:',
      context: context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      to = picked;
      if (status == 'available') {
        makeRoomUnAvailable(
          contxt: context,
          id: id,
          unavailable: SetUnavailableEntityModel(
            from: DateFormat('yyyy-MM-dd').format(from),
            to: DateFormat('yyyy-MM-dd').format(to),
          ),
        );
      } else {
        makeRoomAvailable(contxt: context, id: id);
      }
    }
    notifyListeners();
  }

  Future<void> selectHallDateAvailablibityTo({
    BuildContext? context,
    String? status,
    String? id,
  }) async {
    final DateTime? picked = await showDatePicker(
      helpText: 'Select Availability to:',
      context: context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      to = picked;
      if (status == 'available') {
        makeHallUnAvailable(
          contxt: context,
          id: id,
          unavailable: SetUnavailableEntityModel(
            from: DateFormat('yyyy-MM-dd').format(from),
            to: DateFormat('yyyy-MM-dd').format(to),
          ),
        );
      } else {
        makeHallAvailable(contxt: context, id: id);
      }
    }
    notifyListeners();
  }

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
      _isLoadingDash = true;
      _getStatResponseModel = await runBusyFuture(
        repositoryImply.getStats(),
        throwException: true,
      );

      if (_getStatResponseModel?.success == true) {
        _isLoadingDash = false;
        AppUtils.snackbar(
          contxt,
          message: _getStatResponseModel?.message!.toString(),
        );
        // navigate.navigateTo(Routes.dashboard);
      }
    } catch (e) {
      _isLoadingDash = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAllRooms({contxt, String? date}) async {
    try {
      _isLoadingDash = true;
      _getAllRoomResponseModel = await runBusyFuture(
        repositoryImply.getAllRooms(date!),
        throwException: true,
      );
      _isLoadingDash = false;
    } catch (e) {
      _isLoadingDash = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAllHalls({contxt, String? date}) async {
    try {
      _isLoading = true;
      _getAllHallsResponseModel = await runBusyFuture(
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

  Future<void> getAllHallsReload() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      _getAllHallsResponseModel = await runBusyFuture(
        repositoryImply.getAllHalls(DateFormat('yyyy-MM-dd').format(now)),
        throwException: true,
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> roomCategory({contxt}) async {
    try {
      _isLoading = true;
      _getRoomCategoryResponseModel = await runBusyFuture(
        repositoryImply.roomCategory(),
        throwException: true,
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> roomCategoryReload() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      _getRoomCategoryResponseModel = await runBusyFuture(
        repositoryImply.roomCategory(),
        throwException: true,
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
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
      await getAllRooms(
        contxt: contxt,
        date: DateFormat('yyyy-MM-dd').format(now),
      );
      _isLoading = false;
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
      await getAllHalls(
        contxt: contxt,
        date: DateFormat('yyyy-MM-dd').format(now),
      );
      _isLoading = false;
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
      _makeHallAvailableResponseModel = await runBusyFuture(
        repositoryImply.makeHallUnAvailable(id: id!, unavailable: unavailable),
        throwException: true,
      );
      await getAllHalls(
        contxt: contxt,
        date: DateFormat('yyyy-MM-dd').format(now),
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> makeRoomUnAvailable({
    contxt,
    String? id,
    SetUnavailableEntityModel? unavailable,
  }) async {
    try {
      _isLoading = true;
      _setRoomAllUnavailableResponseModel = await runBusyFuture(
        repositoryImply.makeRoomUnAvailable(id: id!, unavailable: unavailable),
        throwException: true,
      );
      await getAllRooms(
        contxt: contxt,
        date: DateFormat('yyyy-MM-dd').format(now),
      );
      _isLoading = false;
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
      _getAllBookingResponseModel = await runBusyFuture(
        repositoryImply.allBookings(),
        throwException: true,
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> allBookingsReload() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      _getAllBookingResponseModel = await runBusyFuture(
        repositoryImply.allBookings(),
        throwException: true,
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
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
