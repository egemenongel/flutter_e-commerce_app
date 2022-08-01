import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTopBox(context),
          Container(
            height: context.height / 2,
            color: context.colors.onPrimary,
            child: Row(
              children: [
                SizedBox(
                  width: context.width / 2,
                  child: Column(
                    children: [
                      _buildSaleBox(context),
                      _buildBlackBox(context),
                    ],
                  ),
                ),
                _buildHoodiesBox(context)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

SizedBox _buildTopBox(BuildContext context) {
  return SizedBox(
      height: context.height / 2,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            fit: BoxFit.fill,
            'assets/images/image_1.png',
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'home.title'.tr().toTitleCase(),
                style: context.textTheme.headline4!.copyWith(
                  color: context.colors.onSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ));
}

SizedBox _buildSaleBox(BuildContext context) {
  return SizedBox(
    height: context.height / 4,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('home.sale'.tr().toTitleCase(),
            style: context.textTheme.headline4!.copyWith(
              color: context.colors.primary,
            )),
      ),
    ),
  );
}

SizedBox _buildBlackBox(BuildContext context) {
  return SizedBox(
    height: context.height / 4,
    child: Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Image.asset(
          fit: BoxFit.fill,
          'assets/images/image_3.png',
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'home.black'.tr().toTitleCase(),
              style: context.textTheme.headline4!.copyWith(
                color: context.colors.onSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Container _buildHoodiesBox(BuildContext context) {
  return Container(
    color: Colors.red,
    width: context.width / 2,
    child: Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Image.asset(
          fit: BoxFit.fill,
          'assets/images/image_2.png',
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'home.hoodies'.tr().toTitleCase(),
              style: context.textTheme.headline4!.copyWith(
                color: context.colors.onSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
