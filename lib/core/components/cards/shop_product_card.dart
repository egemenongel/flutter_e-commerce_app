import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/features/models/product_model.dart';
import 'package:flutter/material.dart';

class ShopProductCard extends StatelessWidget {
  const ShopProductCard({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.network('${productModel.image}'),
                ),
              ),
              Text('${productModel.title}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Text('${productModel.category}')
            ],
          ),
        ),
        Align(
            alignment: const Alignment(0.8, 0.65),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.onPrimary,
              ),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border)),
            ))
      ],
    );
  }
}
