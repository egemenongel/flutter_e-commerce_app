import 'package:ecommerce_app/core/components/custom_message.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PrimarySnackbar {
  final Widget? icon;
  const PrimarySnackbar({this.icon});
  static show(
    BuildContext context,
    CustomMessage customMessage,
  ) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            backgroundColor: context.colors.primary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            content: customMessage));
}
