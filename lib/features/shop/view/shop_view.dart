import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/features/shop/cubit/shop_cubit.dart';
import 'package:ecommerce_app/product/components/app_bar/shop_app_bar.dart';
import 'package:ecommerce_app/product/components/cards/shop_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: const ShopAppBar(),
      body: _buildProducts(),
    );
  }

  BlocBuilder _buildProducts() {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        return SizedBox(
          child: RefreshIndicator(
            color: context.colors.onPrimary,
            onRefresh: () async {
              await context.read<ShopCubit>().fetchAllProducts();
            },
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.83,
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  bool isLoading = state.isLoading ?? true;
                  return isLoading
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.3 * 8,
                            vertical: 80,
                          ),
                          child: CircularProgressIndicator(
                              color: context.colors.onPrimary),
                        )
                      : ShopProductCard(
                          product: state.products![index],
                        );
                },
                itemCount: state.products?.length ?? 0),
          ),
        );
      },
    );
  }
}
