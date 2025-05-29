import 'package:flutter/material.dart';
import 'package:nine_ja_hotel/screens/app_color.dart';
import 'package:nine_ja_hotel/screens/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
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
                      color: AppColor.white,
                      shadowColor: AppColor.textColor,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        // height: 120,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(color: AppColor.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Total Bookings',
                              color: AppColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 20),
                            TextView(
                              text: '1',
                              color: AppColor.black,
                              fontSize: 32,
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
                      shadowColor: AppColor.textColor,
                      color: AppColor.white,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        // height: 120,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(color: AppColor.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Today\'s Bookings',
                              color: AppColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 20),
                            TextView(
                              text: '1',
                              color: AppColor.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
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
                      shadowColor: AppColor.textColor,
                      color: AppColor.white,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // height: 120,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(color: AppColor.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Total Rooms',
                              color: AppColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 20),
                            TextView(
                              text: '1',
                              color: AppColor.black,
                              fontSize: 32,
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
                      color: AppColor.white,
                      shadowColor: AppColor.textColor,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        // height: 120,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(color: AppColor.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Total Hall',
                              color: AppColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 20),
                            TextView(
                              text: '1',
                              color: AppColor.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
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
              color: AppColor.white,
              shadowColor: AppColor.textColor,
              child: Container(
                width: double.infinity,
                // height: 120,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: BoxDecoration(color: AppColor.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Room Status',
                      color: AppColor.black,
                      fontSize: 24.2,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 10),

                    TextView(
                      text: 'An overview of Room Status',
                      color: AppColor.black,
                      fontSize: 17.20,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.all(4),
                width: 170,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.textColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextView(
                      text: '18/05/2025',
                      color: AppColor.black,
                      fontSize: 17.20,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.calendar_today_rounded,
                      color: const Color.fromARGB(255, 79, 78, 78),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: Card(
                elevation: 2,
                shadowColor: AppColor.textColor,
                color: AppColor.white,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 6),
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 10,
                    children: [
                      ...[1, 2, 3, 4, 5, 6, 7, 8, 9, 0].map(
                        (o) => Container(
                          height: 70,
                          width: 70,
                          margin: EdgeInsets.only(left: 1.80),
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.textColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextView(
                              text: '101',
                              color: AppColor.black,
                              fontSize: 26.30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
  }
}
