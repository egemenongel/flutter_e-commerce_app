import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/components/buttons/main_elevated_button.dart';
import 'package:ecommerce_app/core/components/cards/bag_product_card.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/utils/lang/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class BagView extends StatelessWidget {
  const BagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Column(
          children: [
            _buildTitle(context),
            _buildProducts(context),
            _buildPromoButton(context),
            _buildTotal(context),
            _buildCheckOutButton(context)
          ],
        ),
      ),
    );
  }

  GestureDetector _buildPromoButton(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 12,
                child: Container(
                  height: 50,
                  color: context.colors.background,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(LocaleKeys.bag_promo).tr(),
                      ]),
                ),
              ),
              const Spacer(),
            ],
          ),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_right,
                color: context.colors.onSurface,
              ),
              iconSize: 60,
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildTitle(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.bag_title,
            style: context.textTheme.headline4!.copyWith(
              color: context.colors.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
        ],
      ),
    );
  }

  SizedBox _buildProducts(BuildContext context) {
    return SizedBox(
      height: 450,
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          BagProductCard(),
          BagProductCard(),
          BagProductCard(),
        ],
      ),
    );
  }

  Padding _buildTotal(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.bag_total,
            style: context.textTheme.headline6!.copyWith(
              color: context.colors.onBackground,
              fontWeight: FontWeight.normal,
            ),
          ).tr(),
          Text(
            '1221\$',
            style: context.textTheme.headline6!.copyWith(
              color: context.colors.onBackground,
            ),
          )
        ],
      ),
    );
  }

  Padding _buildCheckOutButton(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: MainElevatedButton(
          onPressed: () {},
          localizationKey: LocaleKeys.common_buttons_check_out),
    );
  }
}
