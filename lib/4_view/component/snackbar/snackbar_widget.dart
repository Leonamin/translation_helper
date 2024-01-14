import 'package:flutter/material.dart';
import 'package:translation_helper/2_res/app_theme/color_hue.dart';
import 'package:translation_helper/theme/text_styles.dart';

enum SnackBarType { info, success, error, warning }

extension SnackBarTypeExt on SnackBarType {
  Color get backgroundColor {
    switch (this) {
      case SnackBarType.info:
        return ColorHue.secondary1;
      case SnackBarType.success:
        return ColorHue.primary1;
      case SnackBarType.error:
        return ColorHue.caution1;
      case SnackBarType.warning:
        return ColorHue.warning1;
    }
  }

  Color get iconColor {
    switch (this) {
      case SnackBarType.info:
        return ColorHue.secondary3;
      case SnackBarType.success:
        return ColorHue.primary3;
      case SnackBarType.error:
        return ColorHue.caution2;
      case SnackBarType.warning:
        return ColorHue.warning2;
    }
  }

  IconData get iconData {
    switch (this) {
      case SnackBarType.info:
        return Icons.info_rounded;
      case SnackBarType.success:
        return Icons.check;
      case SnackBarType.error:
        return Icons.error;
      case SnackBarType.warning:
        return Icons.warning_rounded;
    }
  }
}

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({
    super.key,
    required this.type,
    required this.title,
    this.subText,
    this.titleStyle,
    this.subTextStyle,
    this.showCloseIcon = true,
  });

  final SnackBarType type;
  final String title;
  final String? subText;
  final TextStyle? titleStyle;
  final TextStyle? subTextStyle;
  final bool showCloseIcon;

  void closeSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: type.backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          snackBarIcon(),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: titleStyle ?? TextStyles.body.medium,
                      ),
                    ),
                    if (showCloseIcon)
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: closeIcon(context),
                      ),
                  ],
                ),
                if (subText != null && subText!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      subText ?? '',
                      style:
                          subTextStyle ?? TextStyles.caption.secondaryTextColor,
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget snackBarIcon() {
    return Icon(
      type.iconData,
      size: 24,
      color: type.iconColor,
    );
  }

  Widget closeIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => closeSnackBar(context),
      child: const Icon(
        Icons.close,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}
