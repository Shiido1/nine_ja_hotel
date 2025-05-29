import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nine_ja_hotel/screens/image.dart';

import '../app_color.dart';
import '../bookings_screen.dart';
import '../home_screen.dart';
import '../room_category_screen.dart';
import '../text_widget.dart';

@RoutePage()
class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  int _currentIndex = 0;

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
            splashColor: AppColor.transparent,
            highlightColor: AppColor.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            backgroundColor: const Color.fromARGB(255, 195, 191, 191),
            selectedItemColor: AppColor.white,
            unselectedItemColor: AppColor.black,
            selectedLabelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _currentIndex == 0 ? AppImage.room : AppImage.rRoom,
                  color: _currentIndex == 0 ? AppColor.white : AppColor.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _currentIndex == 1 ? AppImage.room : AppImage.rRoom,
                  color: _currentIndex == 1 ? AppColor.white : AppColor.black,
                ),
                label: 'Bookings',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _currentIndex == 2 ? AppImage.room : AppImage.rRoom,
                  color: _currentIndex == 2 ? AppColor.white : AppColor.black,
                ),
                label: 'Room Category',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _currentIndex == 3 ? AppImage.room : AppImage.rRoom,
                  color: _currentIndex == 3 ? AppColor.white : AppColor.black,
                ),
                label: 'Pos',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
