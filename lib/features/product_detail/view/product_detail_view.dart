import 'package:ecommerce_app/core/components/custom_message.dart';
import 'package:ecommerce_app/core/components/primary_snackbar.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/product/components/buttons/favorite_button.dart';
import 'package:ecommerce_app/core/components/buttons/primary_elevated_button.dart';
import 'package:ecommerce_app/core/components/buttons/primary_expansion_tile.dart';
import 'package:ecommerce_app/core/constants/application_constants.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/features/bag/bloc/bag_bloc.dart';
import 'package:ecommerce_app/product/components/product_rating_bar.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key, required this.product}) : super(key: key);
  static const id = '/productDetail';
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              _buildImage(context),
              _buildActions(context),
              _buildDetails(context),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                ),
              ),
            ],
          )),
          _buildAddToCartButton(context),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.secondary,
      foregroundColor: context.colors.onBackground,
      title: Text(
        product.title!,
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
    );
  }

  Image _buildImage(BuildContext context) {
    return Image.network(
      height: 300,
      product.image ?? ApplicationConstants.dummyImage,
      fit: BoxFit.fitWidth,
    );
  }

  Row _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        // const PrimaryDropdownButton(
        //   items: ['Small', 'Medium', 'Large'],
        // ),
        FavoriteButton(
          iconColor: context.colors.onPrimary,
          productModel: product,
        ),
      ],
    );
  }

  Padding _buildDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: _buildTitle(context),
              subtitle: _buildCategory(),
              trailing: _buildPrice(context),
            ),
          ),
          const SizedBox(height: 15),
          _buildRating(context),
          const SizedBox(height: 15),
          _buildDescription(),
          const PrimaryExpansionTile(LocaleKeys.product_detail_shipping_info),
          const PrimaryExpansionTile(LocaleKeys.product_detail_support),
        ],
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      '${product.title!.split(' ')[0]} ${product.title!.split(' ')[1]} ${product.title!.split(' ')[2]} ',
      style: context.textTheme.headline6,
    );
  }

  Text _buildCategory() {
    return Text(
      product.category!.toTitleCase(),
    );
  }

  Text _buildPrice(BuildContext context) {
    return Text(
      '\$${product.price}',
      style: context.textTheme.headline6,
    );
  }

  ProductRatingBar _buildRating(BuildContext context) {
    return ProductRatingBar(product: product);
  }

  Text _buildDescription() => Text('${product.description}');

  Widget _buildAddToCartButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(20),
        color: context.colors.primary,
        child: PrimaryElevatedButton(
          onPressed: () {
            context.read<BagBloc>().add(BagProductAdded(product));

            PrimarySnackbar.show(
                context,
                CustomMessage(
                    translationKey: LocaleKeys.common_messages_bag_add,
                    icon: Lottie.asset(AssetPaths.animDone, repeat: false)));
          },
          localizationKey: LocaleKeys.common_buttons_add_to_cart,
        ),
      ),
    );
  }
}
