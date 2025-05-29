import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nine_ja_hotel/core/router/router.dart';

class PageNavigator {
  static BuildContext get context => navigatorKey.currentContext!;

  static Future<dynamic> pushRoute(PageRouteInfo<void> route) async {
    HapticFeedback.selectionClick();
    return await context.pushRoute(route);
  }

  static void replace(PageRouteInfo<void> route) {
    HapticFeedback.selectionClick();
    context.router.replaceAll([route]);
  }
}
