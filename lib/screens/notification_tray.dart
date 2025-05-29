import 'package:flutter/material.dart';
import 'package:nine_ja_hotel/core/extension.dart';
import 'package:overlay_support/overlay_support.dart';

import '../core/common/app_colors.dart';

void triggerNotificationTray(
  String message, {
  bool error = false,
  Duration? duration,
  bool ignoreIfNull = false,
}) {
  if (ignoreIfNull) return;
  showOverlayNotification(
    (_) => NotificationTray(message: message, isError: error),
    duration: duration ?? const Duration(milliseconds: 4000),
  );
}

class NotificationTray extends StatelessWidget {
  const NotificationTray({
    super.key,
    required this.message,
    this.isError = false,
  });

  final String message;
  final bool isError;
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isError ? Colors.red : Colors.green,
      ),
      child: Text(
        message,
        style: context.bodyMedium?.copyWith(color: AppColors.white),
      ),
    ),
  );
}
