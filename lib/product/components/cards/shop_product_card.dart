import 'package:ecommerce_app/core/constants/application_constants.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/features/product_detail/view/product_detail_view.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:flutter/material.dart';

class ShopProductCard extends StatelessWidget {
  const ShopProductCard({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailView(
                    productModel: productModel,
                  ))),
      //  Navigator.pushNamed(context, ProductDetailView.id),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  width: 100,
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      productModel.image ?? ApplicationConstants.dummyImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text('${productModel.title}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Text('${productModel.category}'),
                Text(
                  '${productModel.price}\$',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Align(
              alignment: const Alignment(0.5, 0.35),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.onPrimary,
                ),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_border)),
              ))
        ],
      ),
    );
  }
}
