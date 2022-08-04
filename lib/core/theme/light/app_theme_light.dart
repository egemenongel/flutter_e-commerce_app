import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:ecommerce_app/core/theme/color_wheel.dart';
import 'package:flutter/material.dart';

class AppThemeLight extends AppTheme{
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
      colorScheme: _appColorScheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: ColorWheel.shojohiRed,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(
          color: ColorWheel.shojohiRed,
        ),
      ).copyWith());
  ColorScheme get _appColorScheme {
    return const ColorScheme(
      primary: ColorWheel.shojohiRed,
      onPrimary: ColorWheel.doctorWhite,
      secondary: ColorWheel.shojohiRed,
      onSecondary: Colors.black,
      background: ColorWheel.doctorWhite,
      onBackground: ColorWheel.shojohiRed,
      surface: ColorWheel.doctorWhite,
      error: Colors.red,
      onError: ColorWheel.doctorWhite,
      onSurface: Colors.grey,
      brightness: Brightness.light,
    );
  }
}
