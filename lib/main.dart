import 'package:ecommerce_app/core/extensions/theme/theme_notifier.dart';
import 'package:ecommerce_app/features/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ], child: const MyApp()),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      home: const BottomNavBar(),
      theme: context.watch<ThemeNotifier>().currentTheme,
    );
  }
}
