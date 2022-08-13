import 'package:ecommerce_app/core/components/cards/primary_snackbar.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    Key? key,
    required this.iconColor,
  }) : super(key: key);
  final Color iconColor;
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
          PrimarySnackbar.show(context, LocaleKeys.common_messages_favorite);
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: widget.iconColor,
        ));
  }
}
