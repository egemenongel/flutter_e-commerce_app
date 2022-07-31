import 'package:ecommerce_app/core/extensions/theme/theme_notifier.dart';
import 'package:ecommerce_app/features/home/view/home_view.dart';
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
    return const MaterialApp(title: 'Ecommerce App', home: HomeView());
  }
}
