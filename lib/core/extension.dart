import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';

extension StringExtensions on String {
  String get tenWords => split(' ').take(10).join(' ');

  int parseAmount() => int.parse(replaceAll(',', '').replaceAll('.00', ''));

  bool get isNull => toLowerCase() == 'null';

  String get capitalizeFirst => isEmpty ? '' : this[0].toUpperCase();

  String get toCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String get titleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized)
      .join(' ');

  String get removeUnderscore => replaceAll('_', ' ');
  String get removeDoubleZeros => replaceAll('.00', ' ');

  String get removeHyphen => replaceAll('-', ' ');

  String get removeAtcharacter => replaceAll('@', '');

  String _formatPhoneNumber(num phoneNumber) {
    final String phoneNumberStr = phoneNumber.toString();

    if (phoneNumberStr.length != 10) {
      throw ArgumentError("Phone number must have 10 digits");
    }

    return "(${phoneNumberStr.substring(0, 3)}) ${phoneNumberStr.substring(3, 6)} - ${phoneNumberStr.substring(6)}";
  }

  String get formattedPhoneNumber => _formatPhoneNumber(num.parse(this));

  String _reverseFormatPhoneNumber(String formattedPhoneNumber) {
    final String phoneNumberDigits =
        formattedPhoneNumber.replaceAll(RegExp(r'\D'), '');

    if (phoneNumberDigits.length != 10) {
      throw ArgumentError("Invalid formatted phone number");
    }

    return phoneNumberDigits;
  }

  String get reversedFormattedPhoneNumber => _reverseFormatPhoneNumber(this);

  String get formatCountryCode => replaceAll('+234', '0').replaceAll(' ', '');

  num get replaceComma => num.tryParse(replaceAll(',', '')) ?? 0;

  num get toNum => num.tryParse(this) ?? 0;
}

extension ContextExtensions on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width <= 500.0;

  bool get isTablet =>
      MediaQuery.of(this).size.width < 1024.0 &&
      MediaQuery.of(this).size.width >= 650.0;

  bool get isSmallTablet =>
      MediaQuery.of(this).size.width < 650.0 &&
      MediaQuery.of(this).size.width > 500.0;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024.0;

  bool get isSmall =>
      MediaQuery.of(this).size.width < 850.0 &&
      MediaQuery.of(this).size.width >= 560.0;

  bool get isKeyboardUp => MediaQuery.of(this).viewInsets.bottom > 0;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get bottom => MediaQuery.of(this).viewInsets.bottom;

  Size get size => MediaQuery.of(this).size;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  WidgetStateProperty<Color?>? get buttonBackgroundColor =>
      Theme.of(this).elevatedButtonTheme.style?.backgroundColor;

  Color? get divider => Theme.of(this).dividerTheme.color;

  Color? get bottomNavigationBackgroundColor =>
      Theme.of(this).bottomNavigationBarTheme.backgroundColor;

  WidgetStateProperty<Color?>? get outlinegroundColor =>
      Theme.of(this).elevatedButtonTheme.style?.backgroundColor;

  ThemeData get theme => Theme.of(this);

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;
  Color get onSurface => Theme.of(this).colorScheme.onSurface;

  Color get cardColor => Theme.of(this).cardColor;
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      Theme.of(this).bottomNavigationBarTheme;

  Color get errorColor => Theme.of(this).colorScheme.error;
  InputDecorationTheme get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;

  Color get background => Theme.of(this).colorScheme.surface;
  Color get dialogBackgroundColor => Theme.of(this).dialogBackgroundColor;
  BottomSheetThemeData? get bottomSheetTheme => Theme.of(this).bottomSheetTheme;

  Color? get dragHandleColor => Theme.of(this).bottomSheetTheme.dragHandleColor;

  void nextFocus([FocusNode? node]) => FocusScope.of(this).requestFocus(node);
  void unfocus({UnfocusDisposition disposition = UnfocusDisposition.scope}) =>
      FocusScope.of(this).unfocus();

  void dismissTrey() => OverlaySupportEntry.of(this)!.dismiss();

  FilteringTextInputFormatter get charactersOnly =>
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"));

  LengthLimitingTextInputFormatter limit({int max = 11}) =>
      LengthLimitingTextInputFormatter(max);

  TextInputFormatter get digitsOnly => FilteringTextInputFormatter.digitsOnly;

  Future<dynamic> push(Widget child) async => await Navigator.of(this)
      .push(MaterialPageRoute(builder: (context) => child));

  Future<void> pop([dynamic result]) async {
    await HapticFeedback.selectionClick();
    if (Navigator.canPop(this)) {
      Navigator.of(this).pop(result);
    }
  }

  Future<void> popToRoot([String? routeName]) async {
    await HapticFeedback.selectionClick();

    Navigator.of(this).popUntil((route) {
      if (routeName == null) return route.isFirst;
      return route.settings.name == routeName;
    });
  }

  Future<void> clearStackAndPush(String newRouteName,
      {Object? arguments}) async {
    await HapticFeedback.selectionClick();

    Navigator.of(this).pushNamedAndRemoveUntil(newRouteName, (route) => false,
        arguments: arguments);
  }

  bool canPop() => Navigator.canPop(this);

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) async {
    await HapticFeedback.selectionClick();
    return await Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }
}
