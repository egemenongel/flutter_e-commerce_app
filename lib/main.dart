import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/theme/theme_notifier.dart';
import 'package:ecommerce_app/features/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('tr'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
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
      home: const BottomNavBar(),
      theme: context.watch<ThemeNotifier>().currentTheme,
    );
  }
}
