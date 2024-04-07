import 'package:flutter/material.dart';

class TypographyStyles {

  static const defaultColor = Colors.white;

  dynamic getHeadlineLarge({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.4,
        fontFamily: 'Inter',
        color: specifiedColor,
        letterSpacing: 0.1
      );
  }

  dynamic getLabelLarge({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.4,
        fontFamily: 'Inter',
        color: specifiedColor,
        letterSpacing: 0.1,
      );
  }

  dynamic getTitleMedium({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.5,
          fontFamily: 'Inter',
          color: specifiedColor,
          letterSpacing: 0.15
      );
  }

  dynamic getBodyMedium({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.4,
        fontFamily: 'Inter',
        color: specifiedColor,
        letterSpacing: 0.25,
      );
  }

}
