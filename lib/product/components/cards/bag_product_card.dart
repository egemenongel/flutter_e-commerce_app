import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constants/application_constants.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/features/bag/bloc/bag_bloc.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagProductCard extends StatelessWidget {
  const BagProductCard({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () =>
          context.read<BagBloc>().add(BagProductRemoved(product)),
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
            _buildSize(context),
            const SizedBox(
              height: 20,
            ),
            _buildQuantity(context)
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
                Icons.more_vert,
                color: context.colors.onSurface,
              )),
        )
      ],
    );
  }

  Row _buildSize(BuildContext context) {
    return Row(
      children: [
        Text(
          'Size: ',
          style: context.textTheme.caption!.copyWith(),
        ),
        Text(
          'M',
          style:
              context.textTheme.caption!.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Padding _buildQuantity(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 30,
                child: _buildIconButton(
                  context,
                  icon: Icons.remove,
                  voidCallback: () => context
                      .read<BagBloc>()
                      .add(BagProductDecremented(product)),
                ),
              ),
              Text(
                '${product.count}',
                style: context.textTheme.subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
                child: _buildIconButton(context,
                    icon: Icons.add,
                    voidCallback: () => context
                        .read<BagBloc>()
                        .add(BagProductIncremented(product))),
              )
            ],
          ),
          Text(
            '${product.price}\$',
            style: context.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.onBackground,
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildIconButton(BuildContext context,
      {required VoidCallback voidCallback, required IconData icon}) {
    return FloatingActionButton(
      heroTag: null,
      foregroundColor: context.colors.onSurface,
      backgroundColor: context.colors.background,
      onPressed: voidCallback,
      child: Icon(icon),
    );
  }
}
