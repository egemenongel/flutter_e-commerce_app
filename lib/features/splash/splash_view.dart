import 'package:ecommerce_app/core/base/view/base_view.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/features/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  static const id = '/';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..navigateToHome(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Scaffold(
            body: GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(BaseView.id),
              child: Center(
                child: Lottie.asset(AssetPaths.animSplash),
              ),
            ),
          );
        },
      ),
    );
  }
}
