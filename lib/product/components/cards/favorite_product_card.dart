import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/components/buttons/circular_icon_button.dart';
import 'package:ecommerce_app/core/constants/application_constants.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/product/components/product_rating_bar.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:flutter/material.dart';

class FavoriteProductCard extends StatelessWidget {
  const FavoriteProductCard({Key? key, required this.product})
      : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Stack(
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Card(
                  color: context.colors.surface,
                  child: SizedBox(
                    height: 130,
                    child: Row(
                      children: [
                        _buildProductImage(),
                        _buildProductDetails(context),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
          Align(
            alignment: const Alignment(1.05, 0.5),
            child: CircularIconButton(
              iconData: Icons.shopping_bag,
              voidCallback: () {},
              backgroundColor: context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildProductImage() {
    return SizedBox(
      width: 80,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomLeft: Radius.circular(4), //Same with the card
        ),
        child: CachedNetworkImage(
            imageUrl: product.image ?? ApplicationConstants.dummyImage),
      ),
    );
  }

  Expanded _buildProductDetails(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            _buildTitle(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    product.category!.toTitleCase(),
                    style: context.textTheme.caption!.copyWith(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _buildPrice(context)
          ],
        ),
      ),
    );
  }

  Row _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            product.title!,
            style: context.textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.clear,
                color: context.colors.onSurface,
              )),
        )
      ],
    );
  }

  Padding _buildPrice(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '${product.price}\$',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.colors.onBackground,
              ),
            ),
          ),
          Expanded(flex: 4, child: ProductRatingBar(product: product)),
          const Spacer(),
        ],
      ),
    );
  }
}
