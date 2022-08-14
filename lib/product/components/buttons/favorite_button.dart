import 'package:ecommerce_app/core/components/primary_snackbar.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/features/favorites/bloc/favorites_bloc.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    required this.iconColor,
    required this.productModel,
  }) : super(key: key);
  final Color iconColor;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesBloc, FavoritesState>(
      listener: (context, state) {
        //TODO: implement listener
      },
      builder: (context, state) {
        if (state is FavoritesInitial) {
          return const CircularProgressIndicator();
        }
        if (state is FavoritesLoaded) {
          return ElevatedButton(
            onPressed: () {
              productModel.isFavorite == false
                  ? context
                      .read<FavoritesBloc>()
                      .add(FavoritesProductAdded(productModel))
                  : context
                      .read<FavoritesBloc>()
                      .add(FavoritesProductRemoved(productModel));
              PrimarySnackbar.show(
                  context, LocaleKeys.common_messages_favorite);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              onPrimary: context.colors.secondary,
            ),
            child: Icon(
              productModel.isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 20,
              color: context.colors.onPrimary,
            ),
          );
        }
        return const Text('Error!');
      },
    );
  }
}
