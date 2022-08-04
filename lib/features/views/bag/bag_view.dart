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
                  color: context.colors.onPrimary,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('aaaa'),
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
              icon: const Icon(Icons.arrow_circle_right),
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
