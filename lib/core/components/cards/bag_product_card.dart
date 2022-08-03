import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BagProductCard extends StatelessWidget {
  const BagProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _productImage(context),
          _productDetails(context),
        ],
      ),
    );
  }

  Expanded _productDetails(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  't',
                  style: context.textTheme.bodyText2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            ),
            Row(
              children: [
                Text(
                  'Size:',
                  style: context.textTheme.caption!.copyWith(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          child: FloatingActionButton(
                            foregroundColor: context.colors.onSecondary,
                            backgroundColor: context.colors.onPrimary,
                            onPressed: () {},
                            child: const Icon(Icons.remove),
                          ),
                        ),
                        const Text('1'),
                        SizedBox(
                          height: 30,
                          child: FloatingActionButton(
                            foregroundColor: context.colors.onSecondary,
                            backgroundColor: context.colors.onPrimary,
                            onPressed: () {},
                            child: const Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Text('51\$'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Image _productImage(BuildContext context) =>
      Image.asset('assets/images/image_1.png');
}
