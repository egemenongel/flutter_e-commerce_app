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
      primary: Colors.white,
      onPrimary: ColorWheel.shojohiRed,
      secondary: ColorWheel.doctorWhite,
      onSecondary: Colors.black,
      background: Colors.grey,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }
}
