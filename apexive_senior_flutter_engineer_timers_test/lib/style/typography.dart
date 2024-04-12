import 'package:flutter/material.dart';

class TypographyStyles {

  static const defaultColor = Colors.white;

  static TextStyle getDisplaySmall({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.w600,
        height: getLineHeightFrom(fontSize: 36.0, heightInPx: 44.0),
        fontFamily: 'Inter',
        color: specifiedColor,
      );
  }

  static TextStyle getHeadlineLarge({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w700,
        height: getLineHeightFrom(fontSize: 32.0, heightInPx: 40.0),
        fontFamily: 'Inter',
        color: specifiedColor,
      );
  }

  static TextStyle getHeadlineSmall({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        height: getLineHeightFrom(fontSize: 24.0, heightInPx: 32.0),
        fontFamily: 'Inter',
        color: specifiedColor,
      );
  }

  static TextStyle getTitleMedium({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        height: getLineHeightFrom(fontSize: 16.0, heightInPx: 24.0),
        fontFamily: 'Inter',
        color: specifiedColor,
        letterSpacing: 0.15,
      );
  }

  static TextStyle getTitleSmall({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        height: getLineHeightFrom(fontSize: 14.0, heightInPx: 20.0),
        fontFamily: 'Inter',
        color: specifiedColor,
        letterSpacing: 0.1,
      );
  }

  static TextStyle getLabelLarge({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        height: getLineHeightFrom(fontSize: 14.0, heightInPx: 20.0),
        fontFamily: 'Roboto',
        color: specifiedColor,
        letterSpacing: 0.1,
      );
  }

  static TextStyle getBodyLarge({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: getLineHeightFrom(fontSize: 16.0, heightInPx: 24.0),
        fontFamily: 'Inter',
        color: specifiedColor,
        letterSpacing: 0.15,
      );
  }

  static TextStyle getBodyMedium({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        height: getLineHeightFrom(fontSize: 14.0, heightInPx: 20.0),
        fontFamily: 'Inter',
        color: specifiedColor,
        letterSpacing: 0.25,
      );
  }

  static TextStyle getBodySmall({Color specifiedColor = defaultColor}) {
    return
      TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        height: getLineHeightFrom(fontSize: 12.0, heightInPx: 16.0),
        fontFamily: 'Inter',
        color: specifiedColor,
        letterSpacing: 0.4,
      );
  }

  static TextStyle getBottomNavigationNormal({Color specifiedColor = defaultColor})
  {
    return
      TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        height: getLineHeightFrom(fontSize: 10.0, heightInPx: 12.0),
        fontFamily: 'SF Pro',
        color: specifiedColor,
      );
  }

  // calculates Flutter-specific line height
  static double getLineHeightFrom({
    required double fontSize,
    required double heightInPx,
  })
  {
    // font size:    20
    // px height:    24

    // returns: 1.2

    return heightInPx / fontSize;
  }

}
