// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nine_ja_hotel/screens/text_widget.dart';
import 'package:stacked/stacked.dart';

import '../core/connect_end/view_model/auth_view_model.dart';
import '../core/constants.dart';
import '../core/core_folder/app/app.locator.dart';
import 'app_color.dart';

class HallScreen extends StatelessWidget {
  const HallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.getAllHalls(
            contxt: context,
            date: DateFormat('yyyy-MM-dd').format(model.now),
          );
        });
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.redDark.withOpacity(.9),
          body: RefreshIndicator(
            onRefresh: model.getAllHallsReload,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 100, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Hall',
                    color: AppColor.white,
                    fontSize: 28.20,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () async {
                        await model.selectDate(context);
                        model.getAllHalls(
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
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Container(
                                      color: AppColor.redDark.withOpacity(.8),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 4,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: 40),
                                          TextView(
                                            text: 'Name',
                                            color: AppColor.white,
                                            fontSize: 18.20,
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(width: 100),
                                          TextView(
                                            text: 'Price',
                                            color: AppColor.white,
                                            fontSize: 18.20,
                                            fontWeight: FontWeight.w600,
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          SizedBox(width: 80),
                                          TextView(
                                            text: 'Capacity',
                                            color: AppColor.white,
                                            fontSize: 18.20,
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(width: 80),
                                          TextView(
                                            text: 'Availability Status',
                                            color: AppColor.white,
                                            fontSize: 18.20,
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(width: 200),
                                        ],
                                      ),
                                    ),

                                    SingleChildScrollView(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (model.getAllHallsResponseModel !=
                                                  null &&
                                              model
                                                  .getAllHallsResponseModel!
                                                  .data!
                                                  .halls!
                                                  .isNotEmpty)
                                            ...model.getAllHallsResponseModel!.data!.halls!.reversed.map(
                                              (o) => Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 10.0,
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 130,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                  top: 16,
                                                                ),
                                                            child: TextView(
                                                              text: '${o.name}',
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
                                                        ),

                                                        SizedBox(width: 20),

                                                        SizedBox(
                                                          width: 120,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                  top: 16,
                                                                ),
                                                            child: TextView(
                                                              text:
                                                                  '${getCurrency()}${oCcy.format(o.price)}',
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
                                                        ),

                                                        SizedBox(width: 50),

                                                        SizedBox(
                                                          width: 120,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                  top: 16,
                                                                ),
                                                            child: TextView(
                                                              text:
                                                                  '${o.capacity}',
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
                                                        ),

                                                        SizedBox(width: 50),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                top: 14,
                                                              ),
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                // vertical: 4.2,
                                                                horizontal: 10,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            color:
                                                                AppColor.white,
                                                            border: Border.all(
                                                              color:
                                                                  AppColor
                                                                      .green,
                                                            ),

                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  6,
                                                                ),
                                                          ),
                                                          child: TextView(
                                                            text:
                                                                o.status
                                                                    ?.capitalize() ??
                                                                '',
                                                            color:
                                                                AppColor.green,
                                                            fontSize: 18.20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),

                                                        SizedBox(width: 20),
                                                        model
                                                            .selectHallEnabilitiesDialog(
                                                              context,
                                                              hall: o,
                                                            ),

                                                        SizedBox(width: 20),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                top: 16,
                                                              ),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .delete_outline_outlined,
                                                                color:
                                                                    const Color.fromARGB(
                                                                      255,
                                                                      92,
                                                                      23,
                                                                      18,
                                                                    ),
                                                                size: 24,
                                                                weight: 30,
                                                              ),
                                                              SizedBox(
                                                                width: 1.2,
                                                              ),
                                                              TextView(
                                                                text: 'Delete',
                                                                color:
                                                                    const Color.fromARGB(
                                                                      255,
                                                                      92,
                                                                      23,
                                                                      18,
                                                                    ),
                                                                fontSize: 18.20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        SizedBox(width: 20),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        isTablet ? 1000 : 800,
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
