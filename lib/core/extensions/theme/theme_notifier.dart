import 'package:ecommerce_app/core/constants/enums/app_theme_enum.dart';
import 'package:ecommerce_app/core/extensions/theme/dark/app_theme_dark.dart';
import 'package:ecommerce_app/core/extensions/theme/light/app_theme_light.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;

  AppTheme _currentThemeEnum = AppTheme.light;

  AppTheme get currentThemeEnum => _currentThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeTheme() {
    if (_currentThemeEnum == AppTheme.light) {
      _currentTheme = AppThemeDark.instance.theme;
      _currentThemeEnum = AppTheme.dark;
    } else {
      _currentTheme = AppThemeLight.instance.theme;

      _currentThemeEnum = AppTheme.light;
    }
    notifyListeners();
  }
}
