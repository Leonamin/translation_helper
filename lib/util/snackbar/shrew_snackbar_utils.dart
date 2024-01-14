import 'package:flutter/material.dart';
import 'package:translation_helper/4_view/component/snackbar/snackbar_widget.dart';

class ShrewSnackBarUtils {
  static void showSnackBar(
    BuildContext context, {
    required String title,
    required SnackBarType type,
    String? subText,
    TextStyle? titleStyle,
    TextStyle? subTextStyle,
    bool isInfinite = false,
    bool showCloseIcon = true,
    int? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        backgroundColor: type.backgroundColor,
        content: SnackBarWidget(
          type: type,
          title: title,
          subText: subText,
          titleStyle: titleStyle,
          subTextStyle: subTextStyle,
          showCloseIcon: showCloseIcon,
        ),
        duration: isInfinite
            ? const Duration(days: 365)
            : Duration(seconds: duration ?? 3),
      ),
    );
  }
}
