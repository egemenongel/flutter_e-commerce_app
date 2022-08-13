import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/features/bag/bloc/bag_bloc.dart';
import 'package:ecommerce_app/product/components/cards/favorite_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: context.paddingNormal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.favorites_title.tr().toTitleCase(),
                      style: context.textTheme.headline4!.copyWith(
                        color: context.colors.onSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              BlocConsumer<BagBloc, BagState>(
                listener: (context, state) {
                  //TODO: implement listener
                },
                builder: (context, state) {
                  if (state is BagInitial) {
                    return const CircularProgressIndicator();
                  }
                  if (state is BagLoaded) {
                    return state.bag.products.isNotEmpty
                        ? SizedBox(
                            height: 450,
                            child: ListView(
                              padding: context.paddingLow,
                              children: state.bag.products
                                  .map((product) =>
                                      FavoriteProductCard(product: product))
                                  .toList(),
                            ),
                          )
                        : const SizedBox();
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
}
