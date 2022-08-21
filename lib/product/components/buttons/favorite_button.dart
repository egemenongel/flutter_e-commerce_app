import 'package:ecommerce_app/core/components/custom_message.dart';
import 'package:ecommerce_app/core/components/primary_snackbar.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/features/favorites/bloc/favorites_bloc.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    return ElevatedButton(
      onPressed: () {
        if (productModel.isFavorite == false) {
          context
              .read<FavoritesBloc>()
              .add(FavoritesProductAdded(productModel));
          PrimarySnackbar.show(
            context,
            CustomMessage(
                translationKey: LocaleKeys.common_messages_favorite_add,
                icon: Lottie.asset(AssetPaths.animFavorite, repeat: false)),
          );
        } else {
          context
              .read<FavoritesBloc>()
              .add(FavoritesProductRemoved(productModel));
          PrimarySnackbar.show(
              context,
              CustomMessage(
                  translationKey: LocaleKeys.common_messages_favorite_remove,
                  icon: Lottie.asset(AssetPaths.animRemoved, repeat: false)));
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        minimumSize: Size.zero,
        onPrimary: context.colors.secondary,
      ),
      child: _buildIcon(),
    );
  }

  BlocBuilder<FavoritesBloc, FavoritesState> _buildIcon() {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoad) {
          return Icon(
            productModel.isFavorite ? Icons.favorite : Icons.favorite_border,
            size: 20,
            color: context.colors.onPrimary,
          );
        } else if (state is FavoritesError) {
          return const Text('Error');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
