import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/constants/application_constants.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/core/utils/lang/language_manager.dart';
import 'package:ecommerce_app/core/utils/navigation/navigation_manager.dart';
import 'package:ecommerce_app/core/utils/theme/cubit/theme_cubit.dart';
import 'package:ecommerce_app/features/bag/bloc/bag_bloc.dart';
import 'package:ecommerce_app/features/favorites/bloc/favorites_bloc.dart';
import 'package:ecommerce_app/features/shop/cubit/shop_cubit.dart';
import 'package:ecommerce_app/features/shop/service/shop_service.dart';

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
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => BagBloc()..add(BagInitialized()),
                ),
                BlocProvider(
                  create: (context) =>
                      FavoritesBloc()..add(FavoritesInitialized()),
                ),
                BlocProvider(
                  create: (context) => ShopCubit(ShopService()),
                ),
              ],
              child: MyApp(
                state: state,
              ),
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
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: ApplicationConstants.applicationName,
      theme: state!.currentTheme,
      routes: NavigationManager.routes,
    );
  }
}
