import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _buildTopBox(context)),
        Expanded(
          child: Container(
            color: context.colors.onPrimary,
            child: Row(
              children: [
                SizedBox(
                  width: context.width / 2,
                  child: Column(
                    children: [
                      Expanded(child: _buildSaleBox(context)),
                      Expanded(child: _buildBlackBox(context)),
                    ],
                  ),
                ),
                _buildHoodiesBox(context)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

SizedBox _buildTopBox(BuildContext context) {
  return SizedBox(
      height: context.height / 2,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(fit: BoxFit.fill, AssetPaths.image1),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                LocaleKeys.home_title.tr().toTitleCase(),
                style: context.textTheme.headline4!.copyWith(
                  color: context.colors.onPrimary,
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
        child: Text(LocaleKeys.home_sale.tr().toTitleCase(),
            style: context.textTheme.headline4!.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.bold,
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
          AssetPaths.image3,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              LocaleKeys.home_black.tr().toTitleCase(),
              style: context.textTheme.headline4!.copyWith(
                color: context.colors.onPrimary,
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
          AssetPaths.image2,
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              LocaleKeys.home_hoodies.tr().toTitleCase(),
              style: context.textTheme.headline4!.copyWith(
                color: context.colors.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
