import 'package:flutter/cupertino.dart';

class LanguageManager {
  static const enLocale = Locale('en');
  static const trLocale = Locale('tr');

  static List<Locale> get supportedLocales => [enLocale, trLocale];
}
