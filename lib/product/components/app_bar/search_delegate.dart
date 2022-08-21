import 'package:ecommerce_app/features/shop/cubit/shop_cubit.dart';
import 'package:ecommerce_app/product/components/cards/shop_product_list_card.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, 'back'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        final List<ProductModel> suggestions =
            state.products!.where((searchResult) {
          final result = searchResult.title!.toLowerCase();
          final input = query.toLowerCase();

          return result.contains(input);
        }).toList();
        return ListView(
          children:
              suggestions.map((e) => ShopProductListCard(product: e)).toList(),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) => Text(query);

  @override
  List<Widget> buildActions(BuildContext context) => <Widget>[
        IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              if (query.isEmpty) {
                close(context, 'clear');
              }
              query = '';
            })
      ];
}
