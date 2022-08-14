import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/components/header_text.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/features/favorites/bloc/favorites_bloc.dart';
import 'package:ecommerce_app/product/components/cards/favorite_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTitle(context),
              BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, state) {
                  if (state is FavoritesInitial) {
                    return const CircularProgressIndicator();
                  }
               else   if (state is FavoritesLoad) {
                    return state.favoritesModel.products.isNotEmpty
                        ? Padding(
                            padding: context.paddingLow,
                            child: Column(
                              children: state.favoritesModel.products
                                  .map((product) =>
                                      FavoriteProductCard(product: product))
                                  .toList(),
                            ),
                          )
                        : SizedBox(
                            height: 500,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.heart_broken,
                                  size: 100,
                                  color: context.colors.onPrimary,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  LocaleKeys.favorites_empty.tr().toTitleCase(),
                                  style: context.textTheme.headline4!.copyWith(
                                      color: context.colors.onSecondary),
                                )
                              ],
                            ),
                          );
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

  SizedBox _buildTitle(BuildContext context) {
    return const SizedBox(
      height: kToolbarHeight * 1.5,
      child: HeaderText(translationKey: LocaleKeys.favorites_title),
    );
  }
}
