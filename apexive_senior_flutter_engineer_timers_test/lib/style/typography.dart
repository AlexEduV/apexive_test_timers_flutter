import 'package:flutter/material.dart';

class TypographyStyles {

  static const defaultColor = Colors.white;
  static const lineHeight = 1.4;

  //custom offset from the original design to adjust for the different screen sizes
  static const fontSizeOffset = -2;

  dynamic getHeadlineLarge({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 32.0 + fontSizeOffset,
        fontWeight: FontWeight.w700,
        height: lineHeight,
        fontFamily: 'Inter',
        color: specifiedColor,
        letterSpacing: 0.1
      );
  }

  dynamic getLabelLarge({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 14.0 + fontSizeOffset,
        fontWeight: FontWeight.w400,
        height: lineHeight,
        fontFamily: 'Inter',
        color: specifiedColor,
        letterSpacing: 0.1,
      );
  }

  dynamic getTitleMedium({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
          fontSize: 16.0 + fontSizeOffset,
          fontWeight: FontWeight.w600,
          height: lineHeight + 0.1,
          fontFamily: 'Inter',
          color: specifiedColor,
          letterSpacing: 0.15
      );
  }

  dynamic getBodyMedium({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 14.0 + fontSizeOffset,
        fontWeight: FontWeight.w400,
        height: lineHeight,
        fontFamily: 'Inter',
        color: specifiedColor,
        letterSpacing: 0.25,
      );
  }

}
