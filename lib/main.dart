import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/constants/application_constants.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/core/theme/cubit/theme_cubit.dart';
import 'package:ecommerce_app/utils/lang/language_manager.dart';
import 'package:ecommerce_app/utils/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.supportedLocales,
      path: AssetPaths.translationsPath,
      fallbackLocale: LanguageManager.enLocale,
      child: BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MyApp(
              state: state,
            );
          },
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    this.state,
  }) : super(key: key);
  final ThemeState? state;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: ApplicationConstants.applicationName,
      theme: state!.currentTheme,
      routes: NavigationManager.routes,
    );
  }
}
