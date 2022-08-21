import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomMessage extends StatelessWidget {
  const CustomMessage({
    Key? key,
    required this.translationKey,
    this.icon,
  }) : super(key: key);
  final String translationKey;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: Row(
          children: [
            icon ?? const SizedBox(),
            const SizedBox(
              width: 10,
            ),
            Text(
              translationKey.tr(),
              style: context.textTheme.bodyText1!.copyWith(),
            ),
          ],
        ));
  }
}
