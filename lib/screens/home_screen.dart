// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nine_ja_hotel/screens/app_color.dart';
import 'package:nine_ja_hotel/screens/text_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import '../core/connect_end/view_model/auth_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) async {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.getStats(contxt: context);
          await model.getAllRooms(
            contxt: context,
            date: DateFormat('yyyy-MM-dd').format(model.now),
          );
        });
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.redDark,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 2,
                          color: AppColor.red,
                          shadowColor: AppColor.white,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(color: AppColor.red),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Total Bookings',
                                  color: AppColor.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 20),
                                TextView(
                                  text:
                                      '${model.getStatResponseModel?.data?.totalBookings ?? 0}',
                                  color: AppColor.white,
                                  fontSize: 32.80,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Card(
                          elevation: 2,
                          shadowColor: AppColor.white,
                          color: AppColor.red,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(color: AppColor.red),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Today\'s Bookings',
                                  color: AppColor.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 20),
                                TextView(
                                  text:
                                      '${model.getStatResponseModel?.data?.todayS ?? 0}',
                                  color: AppColor.white,
                                  fontSize: 32.80,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 2,
                          shadowColor: AppColor.white,
                          color: AppColor.red,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 8,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(color: AppColor.red),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Total Rooms',
                                  color: AppColor.white,
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 20),
                                TextView(
                                  text:
                                      '${model.getStatResponseModel?.data?.totalRoom ?? 0}',
                                  color: AppColor.white,
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Card(
                          elevation: 2,
                          color: AppColor.red,
                          shadowColor: AppColor.white,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(color: AppColor.red),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Total Hall ',
                                  color: AppColor.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 20),
                                TextView(
                                  text:
                                      '${model.getStatResponseModel?.data?.totalHall ?? 0}',
                                  color: AppColor.white,
                                  fontSize: 32.80,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                Card(
                  elevation: 2,
                  color: AppColor.red,
                  shadowColor: AppColor.white,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    decoration: BoxDecoration(color: AppColor.red),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Room Status',
                          color: AppColor.white,
                          fontSize: 24.2,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 10),

                        TextView(
                          text: 'An overview of Room Status',
                          color: AppColor.white,
                          fontSize: 18.20,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () async {
                      await model.selectDate(context);
                      model.getAllRooms(
                        contxt: context,
                        date: DateFormat('yyyy-MM-dd').format(model.now),
                      );
                      model.notifyListeners();
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      width: 180,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.textColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextView(
                            text: DateFormat('dd/MM/yyyy').format(model.now),
                            color: AppColor.white,
                            fontSize: 17.80,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(width: 15),
                          Icon(
                            Icons.calendar_today_rounded,
                            color: const Color.fromARGB(255, 244, 239, 239),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Center(
                  child: Card(
                    elevation: 2,
                    shadowColor: AppColor.white,
                    color: const Color.fromARGB(250, 255, 110, 100),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 6,
                      ),
                      child:
                          model.isLoadingDash
                              ? Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 6,
                                runSpacing: 10,
                                children: [
                                  ...[
                                    1,
                                    2,
                                    3,
                                    4,
                                    5,
                                    6,
                                    7,
                                    8,
                                    9,
                                    0,
                                    1,
                                    2,
                                    3,
                                    4,
                                    5,
                                    6,
                                    7,
                                    8,
                                    9,
                                    0,
                                  ].map(
                                    (e) => Shimmer.fromColors(
                                      baseColor: AppColor.white,
                                      highlightColor: AppColor.textColor,
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          color: AppColor.white.withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                              : Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 6,
                                runSpacing: 10,
                                children: [
                                  if (model.getAllRoomResponseModel != null &&
                                      model
                                          .getAllRoomResponseModel!
                                          .data!
                                          .rooms!
                                          .isNotEmpty)
                                    ...model
                                        .getAllRoomResponseModel!
                                        .data!
                                        .rooms!
                                        .map(
                                          (o) => model.selectDialog(
                                            context,
                                            room: o,
                                          ),
                                        ),
                                ],
                              ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
