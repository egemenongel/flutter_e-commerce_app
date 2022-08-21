import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({
    Key? key,
    required this.translationKey,
    this.icon,
  }) : super(key: key);
  final String translationKey;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: SizedBox(
          height: 40,
          child: Row(
            children: [
              icon ?? const SizedBox(),
              Text(
                translationKey.tr().toCapitalized(),
                style: context.textTheme.bodyText1!.copyWith(),
              ),
            ],
          )),
    );
  }
}
