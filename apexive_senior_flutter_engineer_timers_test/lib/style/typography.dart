import 'package:flutter/material.dart';

class TypographyStyles {

  static const defaultColor = Colors.white;
  static const lineHeight = 1.4;

  //custom offset from the original design to adjust for the different screen sizes
  static const fontSizeOffset = -3.0;

  static TextStyle getHeadlineLarge({Color specifiedColor = defaultColor}) {
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

  static TextStyle getHeadlineSmall({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 24.0 + fontSizeOffset,
        fontWeight: FontWeight.w700,
        height: lineHeight,
        fontFamily: 'Inter',
        color: specifiedColor,
      );
  }

  static TextStyle getLabelLarge({Color specifiedColor = defaultColor}) {
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

  static TextStyle getTitleMedium({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
          fontSize: 16.0 + fontSizeOffset,
          fontWeight: FontWeight.w600,
          height: lineHeight - 0.1,
          fontFamily: 'Inter',
          color: specifiedColor,
          letterSpacing: 0.15
      );
  }

  static TextStyle getBodyLarge({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: lineHeight,
        fontFamily: 'Inter',
        color: specifiedColor,
        letterSpacing: 0.5,
      );
  }

  static TextStyle getBodyMedium({Color specifiedColor = defaultColor}) {
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

  static TextStyle getBottomNavigationNormal({Color specifiedColor = defaultColor})
  {
    return
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: lineHeight + 0.4,
        fontFamily: 'SF Pro',
        color: specifiedColor,
      );
  }

}
