import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nine_ja_hotel/screens/text_widget.dart';
import 'package:stacked/stacked.dart';

import '../core/connect_end/view_model/auth_view_model.dart';
import '../core/constants.dart';
import '../core/core_folder/app/app.locator.dart';
import 'app_color.dart';

class RoomCategoryScreen extends StatelessWidget {
  const RoomCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.roomCategory(contxt: context);
          
        });
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.redDark.withOpacity(.9),
          body: RefreshIndicator(
            onRefresh: model.roomCategoryReload,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 100, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Types',
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
                        borderRadius: BorderRadius.circular(
                        6,
                      )
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
                                      padding: EdgeInsets.symmetric(vertical: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: 20),
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
                                            text: 'Price 1',
                                            color: AppColor.white,
                                            fontSize: 18.20,
                                            fontWeight: FontWeight.w600,
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          SizedBox(width: 100),
                                          TextView(
                                            text: 'Price 2',
                                            color: AppColor.white,
                                            fontSize: 18.20,
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(width: 60),
                                          TextView(
                                            text: 'No of rooms',
                                            color: AppColor.white,
                                            fontSize: 18.20,
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          // Spacer(),
                                          SizedBox(width: 200),
                                        ],
                                      ),
                                    ),
            
                                    SizedBox(height: 20),
                                    SingleChildScrollView(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      child: Column(
                                        children: [
                                          if (model.getRoomCategoryResponseModel !=
                                                  null &&
                                              model
                                                  .getRoomCategoryResponseModel!
                                                  .data!
                                                  .isNotEmpty)
                                            ...model.getRoomCategoryResponseModel!.data!.reversed.map(
                                              (o) => Container(
                                                padding: EdgeInsets.only(
                                                  bottom: 10,
                                                  left: 10,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 140,
                                                          child: TextView(
                                                            text: '${o.name}',
                                                            color: AppColor.white,
                                                            fontSize: 18.20,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        SizedBox(width: 20),
                                                        SizedBox(
                                                          width: 120,
                                                          child: TextView(
                                                            text:
                                                                '${getCurrency()}${oCcy.format(o.price)}',
                                                            color: AppColor.white,
                                                            fontSize: 18.20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                          ),
                                                        ),
            
                                                        SizedBox(width: 40),
                                                        SizedBox(
                                                          width: 120,
                                                          child: TextView(
                                                            text:
                                                                '\$${model.convertNairaToDollar(double.parse(o.price.toString()))}',
                                                            color: AppColor.white,
                                                            fontSize: 18.20,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
            
                                                        SizedBox(width: 30),
                                                        SizedBox(
                                                          width: 30,
                                                          child: TextView(
                                                            text:
                                                                '${o.roomCount}',
                                                            color: AppColor.white,
                                                            fontSize: 18.20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
            
                                                        SizedBox(width: 20),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.edit_square,
                                                              color:
                                                                  AppColor.yellow,
                                                              size: 24,
                                                            ),
                                                            SizedBox(width: 5.2),
                                                            TextView(
                                                              text: 'Edit',
                                                              color:
                                                                  const Color.fromARGB(
                                                                    255,
                                                                    72,
                                                                    45,
                                                                    3,
                                                                  ),
                                                              fontSize: 18.20,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                            ),
                                                          ],
                                                        ),
            
                                                        SizedBox(width: 20),
                                                        Row(
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
                                                            SizedBox(width: 1.2),
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
                                                                  FontWeight.w600,
                                                            ),
                                                          ],
                                                        ),
            
                                                        SizedBox(width: 20),
                                                      ],
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
