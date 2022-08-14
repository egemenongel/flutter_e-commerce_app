import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/components/buttons/primary_elevated_button.dart';
import 'package:ecommerce_app/core/components/header_text.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/features/bag/bloc/bag_bloc.dart';
import 'package:ecommerce_app/features/success/view/success_view.dart';
import 'package:ecommerce_app/product/components/cards/bag_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagView extends StatelessWidget {
  const BagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.secondary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<BagBloc, BagState>(
                builder: (context, state) {
                  if (state is BagInitial) {
                    return const CircularProgressIndicator();
                  } else if (state is BagLoad) {
                    return state.bag.products.isNotEmpty
                        ? Column(
                            children: [
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  children: [
                                    _buildTitle(context),
                                    ...state.bag.products
                                        .map((product) => Padding(
                                              padding: context.paddingLow,
                                              child: BagProductCard(
                                                  product: product),
                                            ))
                                        .toList(),
                                  ],
                                ),
                              ),
                              _buildPromoButton(context),
                              _buildTotal(context),
                              _buildCheckOutButton(context)
                            ],
                          )
                        : Column(
                            children: [
                              _buildTitle(context),
                              _buildEmptyBag(context),
                            ],
                          );
                  }
                  return const Text('Error!');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildTitle(BuildContext context) {
    return const SizedBox(
        height: kToolbarHeight * 1.5,
        child: HeaderText(translationKey: LocaleKeys.bag_title));
  }

  Padding _buildPromoButton(BuildContext context) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            )),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(context.colors.primary),
          foregroundColor:
              MaterialStateProperty.all(context.colors.onBackground),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    LocaleKeys.bag_promo.tr().toCapitalized(),
                    style: context.textTheme.bodyText1!
                        .copyWith(color: context.colors.onSecondary),
                  ),
                )),
            const Spacer(),
            const Expanded(
              child: Icon(
                Icons.arrow_circle_right,
                size: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildTotal(BuildContext context) {
    return Container(
      height: 50,
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
          BlocBuilder<BagBloc, BagState>(
            builder: (context, state) {
              if (state is BagInitial) {
                return const CircularProgressIndicator();
              } else if (state is BagLoad) {
                return Text(
                  '${state.totalPrice.toStringAsFixed(2)}\$',
                  style: context.textTheme.headline6!.copyWith(
                    color: context.colors.onBackground,
                  ),
                );
              }
              return const Text('Error!');
            },
          )
        ],
      ),
    );
  }

  Padding _buildCheckOutButton(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: PrimaryElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed(SuccessView.id),
          localizationKey: LocaleKeys.common_buttons_check_out),
    );
  }

  Widget _buildEmptyBag(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag,
            size: 100,
            color: context.colors.onPrimary,
          ),
          const SizedBox(height: 10),
          Text(
            LocaleKeys.bag_empty.tr().toTitleCase(),
            style: context.textTheme.headline4!
                .copyWith(color: context.colors.onSecondary),
          )
        ],
      ),
    );
  }
}
