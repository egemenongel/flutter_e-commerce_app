import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:ecommerce_app/core/theme/color_wheel.dart';
import 'package:flutter/material.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
      colorScheme: _appColorScheme,
      canvasColor: const Color(0xff2C3333),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
        backgroundColor: Colors.black,
        selectedItemColor: ColorWheel.shojohiRed,
        unselectedItemColor: Colors.white,
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
      background: Color.fromARGB(255, 61, 75, 75),
      onBackground: Colors.white,
      surface: Color(0xff2C3333),
      onSurface: Colors.white,
      error: Colors.red,
      onError: ColorWheel.doctorWhite,
      brightness: Brightness.light,
    );
  }
}
