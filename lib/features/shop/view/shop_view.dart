import 'package:ecommerce_app/features/shop/cubit/shop_cubit.dart';
import 'package:ecommerce_app/features/shop/service/shop_service.dart';
import 'package:ecommerce_app/product/components/cards/shop_product_card.dart';
import 'package:ecommerce_app/core/components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(ShopService()),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: _buildProducts(),
      ),
    );
  }

  BlocConsumer _buildProducts() {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              bool isLoading = state.isLoading ?? true;
              return isLoading
                  ? const CircularProgressIndicator()
                  : ShopProductCard(
                      productModel: state.products![index],
                    );
            },
            itemCount: state.products?.length ?? 0);
      },
    );
  }
}
