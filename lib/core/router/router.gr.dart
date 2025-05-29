// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:nine_ja_hotel/screens/dashboard/dashboard_screen.dart' as _i1;
import 'package:nine_ja_hotel/screens/login_screen.dart' as _i2;

/// generated route for
/// [_i1.Dashboard]
class Dashboard extends _i3.PageRouteInfo<void> {
  const Dashboard({List<_i3.PageRouteInfo>? children})
    : super(Dashboard.name, initialChildren: children);

  static const String name = 'Dashboard';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.Dashboard();
    },
  );
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i3.PageRouteInfo<void> {
  const LoginScreen({List<_i3.PageRouteInfo>? children})
    : super(LoginScreen.name, initialChildren: children);

  static const String name = 'LoginScreen';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i2.LoginScreen();
    },
  );
}
