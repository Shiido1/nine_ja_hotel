import 'dart:io';

import 'package:intl/intl.dart';

final oCcy = NumberFormat("#,##0.00", "en_US");

String getCurrency() {
  var format = NumberFormat.simpleCurrency(
    locale: Platform.localeName,
    name: 'NGN',
  );
  return format.currencySymbol;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
