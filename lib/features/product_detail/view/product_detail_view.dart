import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/components/buttons/main_elevated_button.dart';
import 'package:ecommerce_app/core/constants/application_constants.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/theme/color_wheel.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailView({Key? key, required this.productModel}) : super(key: key);
  static const id = '/productDetail';
  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              _buildImage(),
              _buildDetails(context),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                ),
              ),
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              color: context.colors.onPrimary,
              child: MainElevatedButton(
                  onPressed: () {},
                  localizationKey: 'common.buttons.add_to_cart'),
            ),
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
          const SizedBox(
            height: 15,
          ),
          _buildRating(context),
          const SizedBox(
            height: 15,
          ),
          _buildDescription(),
          ExpansionTile(
            title: Text('product_detail.shipping_info'.tr()),
            children: [
              ListTile(
                title: Text('product_detail.shipping_info'.tr()),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('product_detail.support'.tr()),
            children: [
              ListTile(
                title: Text('product_detail.support'.tr()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Image _buildImage() {
    return Image.network(
      productModel.image ?? ApplicationConstants.dummyImage,
      fit: BoxFit.fitWidth,
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
}
