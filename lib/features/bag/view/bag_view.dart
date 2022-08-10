import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/components/buttons/main_elevated_button.dart';
import 'package:ecommerce_app/core/components/cards/bag_product_card.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/features/success/view/success_view.dart';
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
                        Text(LocaleKeys.bag_promo.tr().toCapitalized())
                      ]),
                ),
              ),
              const Spacer(),
            ],
          ),
          Positioned(
            right: 0,
            child: Icon(
              Icons.arrow_right,
              color: context.colors.onSurface,
              size: 60,
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
            LocaleKeys.bag_title.tr().toTitleCase(),
            style: context.textTheme.headline4!.copyWith(
              color: context.colors.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          )
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
            LocaleKeys.bag_total.tr().toTitleCase(),
            style: context.textTheme.headline6!.copyWith(
              color: context.colors.onBackground,
              fontWeight: FontWeight.normal,
            ),
          ),
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
          onPressed: () {
            Navigator.of(context).pushNamed(SuccessView.id);
          },
          localizationKey: LocaleKeys.common_buttons_check_out),
    );
  }
}
