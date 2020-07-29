import 'package:flutter/material.dart';
import 'colors.dart';

enum ButtonTextStyle {
  primary,
  secondary,
  accent,
  error,
  success,
  light,
  dark,
}

/// Get the button text style based on [ButtonTextStyle] type given.
///
/// @param [ButtonTextStyle] style
/// @return [TextStyle]
getButtonTextStyle({ButtonTextStyle style}) {
  switch (style) {
    case ButtonTextStyle.primary:
      return TextStyle(
        color: getColor(type: ColorType.primary),
        fontWeight: FontWeight.bold,
      );
    case ButtonTextStyle.secondary:
      return TextStyle(
        color: getColor(type: ColorType.primary),
        fontWeight: FontWeight.bold,
      );
    case ButtonTextStyle.accent:
      return TextStyle(
        color: getColor(type: ColorType.primary),
        fontWeight: FontWeight.bold,
      );
    case ButtonTextStyle.error:
      return TextStyle(
        color: getColor(type: ColorType.primary),
        fontWeight: FontWeight.bold,
      );
    case ButtonTextStyle.light:
      return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
    case ButtonTextStyle.dark:
      return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
    case ButtonTextStyle.success:
      return TextStyle(
        color: getColor(type: ColorType.primary),
        fontWeight: FontWeight.bold,
      );
    default:
      return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
  }
}
