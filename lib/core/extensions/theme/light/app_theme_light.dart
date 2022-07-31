import 'package:ecommerce_app/core/extensions/theme/app_theme.dart';
import 'package:ecommerce_app/core/extensions/theme/color_wheel.dart';
import 'package:flutter/material.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme,
      );
  ColorScheme get _appColorScheme {
    return const ColorScheme(
      primary: ColorWheel.shojohiRed,
      onPrimary: ColorWheel.doctorWhite,
      secondary: ColorWheel.shojohiRed,
      onSecondary: Colors.grey,
      background: Colors.white,
      onBackground: Colors.grey,
      surface: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      onSurface: Colors.grey,
      brightness: Brightness.light,
    );
  }
}
