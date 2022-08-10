part of 'theme_cubit.dart';

class ThemeState {
  final bool isDark;
  ThemeData _currentTheme = AppThemeLight.instance.theme;

  AppTheme _currentThemeEnum = AppTheme.light;

  AppTheme get currentThemeEnum => _currentThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  ThemeState({required this.isDark}) {
    if (isDark == true) {
      _currentTheme = AppThemeDark.instance.theme;
      _currentThemeEnum = AppTheme.dark;
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      _currentThemeEnum = AppTheme.light;
    }
  }

  ThemeState copyWith({bool? changeTheme}) {
    return ThemeState(isDark: changeTheme ?? isDark);
  }
}
