import 'package:ecommerce_app/core/extensions/theme/app_theme.dart';
import 'package:ecommerce_app/core/extensions/theme/color_wheel.dart';
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
      );
  ColorScheme get _appColorScheme {
    return const ColorScheme(
      primary: ColorWheel.lemonTart,
      onPrimary: ColorWheel.voidColor,
      secondary: Colors.deepOrange,
      onSecondary: Colors.grey,
      background: Colors.white,
      onBackground: Colors.grey,
      surface: Colors.white,
      onSurface: Colors.grey,
      error: Colors.red,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }
}
