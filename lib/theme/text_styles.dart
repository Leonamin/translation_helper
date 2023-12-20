import 'package:flutter/material.dart';

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

  static TextStyle get medium => body.copyWith(
        fontWeight: FontWeight.w500,
      );
}
