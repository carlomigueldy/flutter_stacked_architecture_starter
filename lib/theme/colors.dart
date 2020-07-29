import 'package:flutter/material.dart';

enum ColorType {
  primary,
  secondary,
  accent,
  error,
  success,
  light,
  dark,
}

/// Get the color based on type.
///
/// @param [ColorType] type
/// @return [Colors]
getColor({ColorType type}) {
  switch (type) {
    case ColorType.primary:
      return Colors.indigo;
    case ColorType.secondary:
      return Colors.grey[800];
    case ColorType.accent:
      return Colors.indigo[100];
    case ColorType.error:
      return Colors.red;
    case ColorType.success:
      return Colors.green;
    case ColorType.dark:
      return Colors.white;
    case ColorType.light:
      return Colors.black;
    default:
      return Colors.indigo;
  }
}
