import 'package:ecommerce_app/core/components/custom_app_bar.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return _buildProduct(context);
        },
        itemCount: 30,
      ),
    );
  }

  Stack _buildProduct(BuildContext context) => Stack(
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
                    child: Image.asset('assets/images/image_1.png'),
                  ),
                ),
                const Text('Gucci'),
                const Text('T-Shirt')
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
