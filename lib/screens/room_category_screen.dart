import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nine_ja_hotel/screens/text_widget.dart';

import 'app_color.dart';

class RoomCategoryScreen extends StatelessWidget {
  const RoomCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: 'Types',
              color: AppColor.black,
              fontSize: 28.20,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 600,
              child: Card(
                elevation: 2,
                color: AppColor.white,
                shadowColor: AppColor.textColor,
                child: Container(
                  width: double.infinity,
                  // margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColor.white),
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
                                  color: AppColor.textColor.withOpacity(.4),
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 20),
                                      TextView(
                                        text: 'Name',
                                        color: AppColor.black,
                                        fontSize: 18.20,
                                        textOverflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(width: 100),
                                      // Spacer(),
                                      TextView(
                                        text: 'Price 1',
                                        color: AppColor.black,
                                        fontSize: 18.20,
                                        fontWeight: FontWeight.w500,
                                        textOverflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      // Spacer(),
                                      SizedBox(width: 80),
                                      TextView(
                                        text: 'Price 2',
                                        color: AppColor.black,
                                        fontSize: 18.20,
                                        textOverflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      // Spacer(),
                                      SizedBox(width: 60),
                                      TextView(
                                        text: 'No of rooms',
                                        color: AppColor.black,
                                        fontSize: 16.20,
                                        textOverflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      // Spacer(),
                                      SizedBox(width: 200),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 20),
                                SingleChildScrollView(
                                  padding: EdgeInsets.symmetric(horizontal: 2),
                                  child: Column(
                                    children: [
                                      ...[
                                        1,
                                        2,
                                        3,
                                        2,
                                        2,
                                        2,
                                        5,
                                        55,
                                        5,
                                        5,
                                        5,
                                        5,
                                        5,
                                        5,
                                        5,
                                        5,
                                      ].map(
                                        (o) => Container(
                                          padding: EdgeInsets.only(
                                            bottom: 10,
                                            left: 10,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 120,
                                                child: TextView(
                                                  text: 'Kings Suite',
                                                  color: AppColor.black,
                                                  fontSize: 18.20,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              SizedBox(
                                                width: 120,
                                                child: TextView(
                                                  text: '₦50,000.00',
                                                  color: AppColor.black,
                                                  fontSize: 18.20,
                                                  fontWeight: FontWeight.w400,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),

                                              SizedBox(width: 40),
                                              SizedBox(
                                                width: 120,
                                                child: TextView(
                                                  text: '\$50.00',
                                                  color: AppColor.black,
                                                  fontSize: 18.20,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),

                                              SizedBox(width: 30),
                                              SizedBox(
                                                width: 30,
                                                child: TextView(
                                                  text: '1',
                                                  color: AppColor.black,
                                                  fontSize: 18.20,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),

                                              SizedBox(width: 20),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.edit_square,
                                                    color: AppColor.yellow,
                                                    size: 24,
                                                  ),
                                                  SizedBox(width: 10),
                                                  TextView(
                                                    text: 'Edit',
                                                    color: AppColor.black,
                                                    fontSize: 18.20,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ],
                                              ),

                                              SizedBox(width: 20),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: AppColor.red,
                                                    size: 24,
                                                  ),
                                                  SizedBox(width: 10),
                                                  TextView(
                                                    text: 'Delete',
                                                    color: AppColor.black,
                                                    fontSize: 18.20,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ],
                                              ),

                                              SizedBox(width: 20),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: 30),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
