import 'package:ecommerce_app/core/components/buttons/main_elevated_button.dart';
import 'package:ecommerce_app/core/components/cards/bag_product_card.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BagView extends StatelessWidget {
  const BagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            _buildTitle(context),
            _buildProducts(context),
            _buildTotal(context),
            _buildCheckOutButton(context)
          ],
        ),
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
            'My Bag',
            style: context.textTheme.headline4!.copyWith(
              color: context.colors.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildProducts(BuildContext context) {
    return SizedBox(
      height: context.height * (3 / 5),
      child: ListView(
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
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'bag.total',
            style: context.textTheme.headline6!.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            '1221\$',
            style: context.textTheme.headline6!.copyWith(
              color: context.colors.onSecondary,
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
          onPressed: () {}, localizationKey: 'bag.check_out'),
    );
  }
}
