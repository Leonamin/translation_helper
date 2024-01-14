import 'package:flutter/material.dart';
import 'package:translation_helper/2_res/app_theme/color_hue.dart';

class TextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle body = TextStyle(
    fontSize: 16,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 14,
  );
}

extension TextStylesExt on TextStyle {
  TextStyle get mainTextColor => copyWith(
        color: ColorHue.grey9,
      );

  TextStyle get secondaryTextColor => copyWith(
        color: ColorHue.grey6,
      );

  TextStyle get medium => copyWith(
        fontWeight: FontWeight.w500,
      );

  TextStyle get semibold => copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle get bold => copyWith(
        fontWeight: FontWeight.w700,
      );
}
