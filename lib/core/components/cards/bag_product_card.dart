import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BagProductCard extends StatelessWidget {
  const BagProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            _buildProductImage(),
            _buildProductDetails(context),
          ],
        ),
      ),
    );
  }

  ClipRRect _buildProductImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(4),
        bottomLeft: Radius.circular(4), //Same with the card
      ),
      child: Image.asset('assets/images/image_1.png'),
    );
  }

  Expanded _buildProductDetails(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(8),
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
        Text(
          'Product Title',
          style: context.textTheme.bodyText2!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
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
                child: FloatingActionButton(
                  foregroundColor: context.colors.onSurface,
                  backgroundColor: context.colors.onPrimary,
                  onPressed: () {},
                  child: const Icon(Icons.remove),
                ),
              ),
              Text(
                '1',
                style: context.textTheme.subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
                child: FloatingActionButton(
                  foregroundColor: context.colors.onSurface,
                  backgroundColor: context.colors.onPrimary,
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              )
            ],
          ),
          Text(
            '51\$',
            style: context.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
