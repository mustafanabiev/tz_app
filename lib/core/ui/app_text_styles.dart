import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle textStyleF16(
    Color color, {
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w500,
      );

  static TextStyle textStyleF14(
    Color color, {
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontSize: 14,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w500,
      );
}
