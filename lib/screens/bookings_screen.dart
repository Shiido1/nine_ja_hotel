// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nine_ja_hotel/screens/app_color.dart';
import 'package:stacked/stacked.dart';

import '../core/connect_end/view_model/auth_view_model.dart';
import '../core/constants.dart';
import '../core/core_folder/app/app.locator.dart';
import 'text_widget.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.allBookings(contxt: context);
        });
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.redDark.withOpacity(.9),
          body: RefreshIndicator(
            onRefresh: model.allBookingsReload,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 100, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Bookings',
                    color: AppColor.white,
                    fontSize: 28.20,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 20),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        6,
                      ), // 👈 set the corner radius here
                    ),
                    color: AppColor.red.withOpacity(.9),
                    shadowColor: AppColor.white,
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxHeight:
                            isTablet
                                ? 660
                                : 580, // ⬅️ Maximum height in logical pixels
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.red.withOpacity(.9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: CupertinoScrollbar(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CupertinoScrollbar(
                                child: SingleChildScrollView(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth:
                                          isTablet
                                              ? 1000
                                              : 800, // <-- your desired total table width
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 20),
                                        Container(
                                          color: AppColor.redDark.withOpacity(
                                            .8,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 4,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 20),
                                              TextView(
                                                text: 'Reference',
                                                color: AppColor.white,
                                                fontSize: 18.20,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              SizedBox(width: 60),
                                              TextView(
                                                text: 'Amount',
                                                color: AppColor.white,
                                                fontSize: 18.20,
                                                fontWeight: FontWeight.w600,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              SizedBox(width: 70),
                                              TextView(
                                                text: 'Customer',
                                                color: AppColor.white,
                                                fontSize: 18.20,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),

                                              SizedBox(width: 100),
                                              TextView(
                                                text: 'Status',
                                                color: AppColor.white,
                                                fontSize: 18.20,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              SizedBox(width: 60),
                                              TextView(
                                                text: 'Checked In',
                                                color: AppColor.white,
                                                fontSize: 18.20,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              SizedBox(width: 60),
                                              TextView(
                                                text: 'Booked On',
                                                color: AppColor.white,
                                                fontSize: 18.20,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                maxLines: 1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              SizedBox(width: 40),
                                            ],
                                          ),
                                        ),

                                        SizedBox(height: 20),
                                        SingleChildScrollView(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 2,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (model.getAllBookingResponseModel !=
                                                      null &&
                                                  model
                                                      .getAllBookingResponseModel!
                                                      .data!
                                                      .isNotEmpty)
                                                ...model.getAllBookingResponseModel!.data!.map(
                                                  (o) => Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 140.2,
                                                            child: TextView(
                                                              text:
                                                                  '${o.reference}',
                                                              color:
                                                                  AppColor
                                                                      .white,
                                                              fontSize: 18.20,
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          SizedBox(width: 20),
                                                          SizedBox(
                                                            width: 120,
                                                            child: TextView(
                                                              text:
                                                                  '${getCurrency()}${oCcy.format(o.amountPaid)}',
                                                              color:
                                                                  AppColor
                                                                      .white,
                                                              fontSize: 18.20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                          SizedBox(width: 20),
                                                          SizedBox(
                                                            width: 160,
                                                            child: TextView(
                                                              text:
                                                                  o
                                                                      .customer
                                                                      ?.name ??
                                                                  '',
                                                              color:
                                                                  AppColor
                                                                      .white,
                                                              fontSize: 18.20,
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          SizedBox(width: 40),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  vertical: 4.2,
                                                                  horizontal: 6,
                                                                ),
                                                            decoration: BoxDecoration(
                                                              color:
                                                                  AppColor
                                                                      .white,
                                                              border: Border.all(
                                                                color:
                                                                    AppColor
                                                                        .green,
                                                              ),

                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    10,
                                                                  ),
                                                            ),
                                                            child: TextView(
                                                              text:
                                                                  o.status
                                                                      ?.capitalize() ??
                                                                  '',
                                                              color:
                                                                  AppColor
                                                                      .green,
                                                              fontSize: 18.20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          SizedBox(width: 60),
                                                          TextView(
                                                            text:
                                                                '${o.checkedIn}',
                                                            color:
                                                                AppColor.white,
                                                            fontSize: 18.20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                          SizedBox(width: 40),
                                                          TextView(
                                                            text:
                                                                '${o.checkedIn}',
                                                            color:
                                                                AppColor.white,
                                                            fontSize: 18.20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                          SizedBox(width: 20),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            isTablet
                                                                ? 1000
                                                                : 800,
                                                        child: Divider(
                                                          color: AppColor.white,
                                                          thickness: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
