import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/features/shop/cubit/shop_cubit.dart';
import 'package:ecommerce_app/product/components/app_bar/shop_app_bar.dart';
import 'package:ecommerce_app/product/components/cards/shop_product_grid_card.dart';
import 'package:ecommerce_app/product/components/cards/shop_product_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.secondary,
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
                await context.read<ShopCubit>().fetchAllProducts(
                      params: context.read<ShopCubit>().parameters,
                    );
              },
              child: state.isGrid
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                            : ShopProductGridCard(
                                product: state.products![index],
                              );
                      },
                      itemCount: state.products?.length ?? 0)
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: ((context, index) {
                        bool isLoading = state.isLoading ?? true;
                        return isLoading
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 20),
                                height: 110,
                                width: 110,
                                child: FittedBox(
                                  child: CircularProgressIndicator(
                                      strokeWidth: 4,
                                      color: context.colors.onPrimary),
                                ),
                              )
                            : ShopProductListCard(
                                product: state.products![index],
                              );
                      }),
                      itemCount: state.products?.length ?? 0,
                    )),
        );
      },
    );
  }
}
