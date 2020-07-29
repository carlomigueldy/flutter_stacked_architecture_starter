import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

import '../theme/colors.dart' show ColorType, getColor;
import '../theme/shapes.dart' show shape;

@lazySingleton
class ThemeService with ReactiveServiceMixin {
  ThemeService() {
    listenToReactiveValues([_theme]);
  }

  static final fontFamily = GoogleFonts.poppins().fontFamily;

  RxValue<ThemeMode> _theme = RxValue<ThemeMode>(initial: ThemeMode.light);
  ThemeMode get theme => _theme.value;
  bool get isDark => _theme.value == ThemeMode.dark;
  bool get isLight => _theme.value == ThemeMode.light;

  /// Toggles the theme [ThemeMode]
  ///
  /// @return void
  void toggleTheme() {
    print('[Theme Service] called toggleTheme()');
    print(
        '[Theme Service] the current theme is ' + (isDark ? 'dark' : 'light'));
    if (_theme.value == ThemeMode.light) {
      _theme.value = ThemeMode.dark;
    } else {
      _theme.value = ThemeMode.light;
    }
  }

  /// Here we define our theme colors for dark mode
  ThemeData get darkTheme {
    return ThemeData(
      primaryColor: getColor(type: ColorType.primary),
      accentColor: getColor(type: ColorType.accent),
      primarySwatch: getColor(type: ColorType.primary),
      fontFamily: fontFamily,
      brightness: Brightness.dark,
      cardTheme: CardTheme(
        shape: shape,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: getColor(type: ColorType.primary),
        textTheme: ButtonTextTheme.primary,
        shape: shape,
      ),
    );
  }

  /// Here we define our theme colors for light theme
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: getColor(type: ColorType.primary),
      accentColor: getColor(type: ColorType.accent),
      primarySwatch: getColor(type: ColorType.primary),
      fontFamily: fontFamily,
      brightness: Brightness.light,
      cardTheme: CardTheme(
        shape: shape,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: getColor(type: ColorType.primary),
        textTheme: ButtonTextTheme.primary,
        shape: shape,
      ),
    );
  }
}
