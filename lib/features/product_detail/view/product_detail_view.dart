import 'package:ecommerce_app/core/components/buttons/favorite_button.dart';
import 'package:ecommerce_app/core/components/buttons/primary_dropdown_button.dart';
import 'package:ecommerce_app/core/components/buttons/primary_expansion_tile.dart';
import 'package:ecommerce_app/core/constants/application_constants.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/core/utils/theme/color_wheel.dart';
import 'package:ecommerce_app/features/bag/bloc/bag_bloc.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key, required this.productModel})
      : super(key: key);
  static const id = '/productDetail';
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: context.colors.onPrimary,
      foregroundColor: context.colors.onSecondary,
      title: Text(
        productModel.title!,
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
    );
  }

  Container _buildImage(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      height: 500,
      child: Image.network(
        productModel.image ?? ApplicationConstants.dummyImage,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Padding _buildActions(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const PrimaryDropdownButton(
            items: ['Small', 'Medium', 'Large'],
          ),
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: const FavoriteButton(),
          ),
        ],
      ),
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
      '${productModel.title!.split(' ')[0]} ${productModel.title!.split(' ')[1]} ${productModel.title!.split(' ')[2]}',
      style: context.textTheme.headline6,
    );
  }

  Text _buildCategory() {
    return Text(
      productModel.category!.toTitleCase(),
    );
  }

  Text _buildPrice(BuildContext context) {
    return Text(
      '\$${productModel.price}',
      style: context.textTheme.headline6,
    );
  }

  Row _buildRating(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingBarIndicator(
          rating: productModel.rating!.rate!,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: ColorWheel.mangoLatte,
          ),
          itemSize: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            '(${productModel.rating!.count!})',
            style: context.textTheme.caption,
          ),
        )
      ],
    );
  }

  Text _buildDescription() => Text('${productModel.description}');

  Widget _buildAddToCartButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(20),
        color: context.colors.onPrimary,
        child: BlocConsumer<BagBloc, BagState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return TextButton(
              onPressed: () =>
                  context.read<BagBloc>().add(BagProductAdded(productModel)),
              child: const Text('ADD'),
            );
          },
        ),
      ),
    );
  }
}
