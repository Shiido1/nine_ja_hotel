import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nine_ja_hotel/screens/image.dart';

import '../app_color.dart';
import '../bookings_screen.dart';
import '../home_screen.dart';
import '../room_category_screen.dart';
import '../text_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  static const List<Option> options = [
    Option(name: "Home", icon: AppImage.room, color: AppColor.white),
    Option(name: "Bookings", icon: AppImage.reservation, color: AppColor.white),
    Option(
      name: "Room Category",
      icon: AppImage.categgory,
      color: AppColor.white,
    ),
    Option(name: "Hall", icon: AppImage.hall, color: AppColor.white),
  ];

  Option get option => options[_currentIndex];

  final List<Widget> _body = [
    HomeScreen(),
    BookingsScreen(),
    RoomCategoryScreen(),
    Container(),
  ];

  Future<bool> willPopControl() async {
    return (await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                content: TextView(
                  text: 'Do you want to exit the app',
                  textAlign: TextAlign.center,
                  fontSize: 18.0,
                  color: AppColor.black,
                  fontWeight: FontWeight.w400,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColor.red, // Text Color
                        ),
                        child: TextView(
                          text: 'No',
                          fontSize: 20,
                          color: AppColor.red,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () => exitApp(),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColor.green, // Text Color
                        ),
                        child: TextView(
                          text: 'Yes',
                          fontSize: 20,
                          color: AppColor.green,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        )) ??
        false;
  }

  exitApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemChannels.platform.invokeListMethod('SystemNavigator.pop');
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: willPopControl,
      child: Scaffold(
        body: Center(child: _body[_currentIndex]),
        bottomNavigationBar: Theme(
          data: ThemeData(
            // splashColor: AppColor.redDark.withOpacity(.9),
            highlightColor: AppColor.redDark.withOpacity(.9),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            backgroundColor: option.color,
            // selectedFontSize: 16.0,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.60),
            type: BottomNavigationBarType.shifting,
            items: [
              for (final option in options)
                BottomNavigationBarItem(
                  backgroundColor: AppColor.redDark,
                  icon: SvgPicture.asset(
                    option.icon,
                    color: AppColor.white,
                    height: 26,
                    width: 25.0,
                  ),
                  label: option.name,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class Option {
  final String name;
  final String icon;
  final Color color;
  const Option({required this.name, required this.icon, required this.color});
}
