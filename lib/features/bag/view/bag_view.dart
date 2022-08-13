import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/components/buttons/primary_elevated_button.dart';
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
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTitle(context),
              _buildProducts(context),
              BlocConsumer<BagBloc, BagState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is BagInitial) {
                    return const CircularProgressIndicator();
                  }
                  if (state is BagLoaded) {
                    return state.bag.products.isNotEmpty
                        ? Column(
                            children: [
                              _buildPromoButton(context),
                              _buildTotal(context),
                              _buildCheckOutButton(context)
                            ],
                          )
                        : _buildEmptyBag();
                  }
                  return const Text('Error!');
                },
              ),
            ],
          ),
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

  BlocConsumer _buildProducts(BuildContext context) {
    return BlocConsumer<BagBloc, BagState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is BagInitial) {
          return const CircularProgressIndicator();
        }
        if (state is BagLoaded) {
          return SizedBox(
            height: 450,
            child: ListView(
              padding: context.paddingLow,
              children: state.bag.products
                  .map((product) => BagProductCard(product: product))
                  .toList(),
            ),
          );
        }
        return const Text('Error!');
      },
    );
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
          backgroundColor: MaterialStateProperty.all(context.colors.background),
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
                        .copyWith(color: context.colors.onSurface),
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
          BlocConsumer<BagBloc, BagState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is BagInitial) {
                return const CircularProgressIndicator();
              }
              if (state is BagLoaded) {
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

  SizedBox _buildEmptyBag() {
    return const SizedBox();
  }
}
