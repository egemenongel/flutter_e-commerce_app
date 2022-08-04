import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/core/theme/theme_notifier.dart';
import 'package:ecommerce_app/utils/lang/language_manager.dart';
import 'package:ecommerce_app/utils/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.supportedLocales,
      path: AssetPaths.translationsPath,
      fallbackLocale: LanguageManager.enLocale,
      child: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ], child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Ecommerce App',
      theme: context.watch<ThemeNotifier>().currentTheme,
      routes: NavigationManager.routes,
    );
  }
}
