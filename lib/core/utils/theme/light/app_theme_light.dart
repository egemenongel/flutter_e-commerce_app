import 'package:ecommerce_app/core/utils/theme/app_theme.dart';
import 'package:ecommerce_app/core/utils/theme/color_wheel.dart';
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
        backgroundColor: Colors.white,
        selectedItemColor: ColorWheel.shojohiRed,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        selectedIconTheme: const IconThemeData(
          color: ColorWheel.shojohiRed,
        ),
      ));
  ColorScheme get _appColorScheme {
    return const ColorScheme(
      primary: ColorWheel.shojohiRed,
      onPrimary: Colors.white,
      secondary: ColorWheel.shojohiRed,
      onSecondary: Colors.black,
      background: ColorWheel.doctorWhite,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.grey,
      error: Colors.red,
      onError: ColorWheel.doctorWhite,
      brightness: Brightness.light,
    );
  }
}
