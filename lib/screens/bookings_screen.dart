import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nine_ja_hotel/screens/app_color.dart';

import 'text_widget.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

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
              text: 'Bookings',
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
                          CupertinoScrollbar(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Container(
                                    color: AppColor.textColor.withOpacity(.4),
                                    padding: EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 20),
                                        TextView(
                                          text: 'Reference',
                                          color: AppColor.black,
                                          fontSize: 18.20,
                                          textOverflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(width: 60),
                                        // Spacer(),
                                        TextView(
                                          text: 'Amount',
                                          color: AppColor.black,
                                          fontSize: 18.20,
                                          fontWeight: FontWeight.w500,
                                          textOverflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        // Spacer(),
                                        SizedBox(width: 60),
                                        TextView(
                                          text: 'Customer',
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
                                        SizedBox(width: 40),
                                        TextView(
                                          text: 'Status',
                                          color: AppColor.black,
                                          fontSize: 18.20,
                                          textOverflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          fontWeight: FontWeight.w500,
                                        ),

                                        // Spacer(),
                                        SizedBox(width: 60),
                                        TextView(
                                          text: 'Checked In',
                                          color: AppColor.black,
                                          fontSize: 18.20,
                                          textOverflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        // Spacer(),
                                        SizedBox(width: 60),
                                        TextView(
                                          text: 'Booked On',
                                          color: AppColor.black,
                                          fontSize: 18.20,
                                          textOverflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          fontWeight: FontWeight.w500,
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
                                      children: [
                                        ...[
                                          1,
                                          2,
                                          3,
                                          2,
                                          2,
                                          2,
                                          2,
                                          2,
                                          2,
                                          2,
                                          2,
                                          2,
                                          2,
                                          2,
                                          2,
                                          2,
                                          22,
                                          2,
                                          2,
                                          22,
                                        ].map(
                                          (o) => Container(
                                            padding: EdgeInsets.only(
                                              bottom: 10,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 120,
                                                  child: TextView(
                                                    text: 'RE9A12000010',
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
                                                    text: '₦25,500.00',
                                                    color: AppColor.black,
                                                    fontSize: 18.20,
                                                    fontWeight: FontWeight.w400,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ),

                                                SizedBox(width: 20),
                                                SizedBox(
                                                  width: 160,
                                                  child: TextView(
                                                    text: 'Olufemi Oyebolu',
                                                    color: AppColor.black,
                                                    fontSize: 18.20,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),

                                                SizedBox(width: 40),
                                                SizedBox(
                                                  width: 60,
                                                  child: TextView(
                                                    text: '1',
                                                    color: AppColor.black,
                                                    fontSize: 18.20,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),

                                                SizedBox(width: 40),
                                                Container(
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: AppColor.green,
                                                    ),

                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                  child: TextView(
                                                    text: 'Paid',
                                                    color: AppColor.green,
                                                    fontSize: 18.20,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),

                                                SizedBox(width: 60),
                                                TextView(
                                                  text: 'May 12, 2025',
                                                  color: AppColor.black,
                                                  fontSize: 18.20,
                                                  fontWeight: FontWeight.w400,
                                                ),

                                                SizedBox(width: 40),
                                                TextView(
                                                  text: 'May 12, 2025',
                                                  color: AppColor.black,
                                                  fontSize: 18.20,
                                                  fontWeight: FontWeight.w400,
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
