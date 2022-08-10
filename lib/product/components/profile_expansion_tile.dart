import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:flutter/material.dart';

class ProfileExpansionTile extends StatelessWidget {
  const ProfileExpansionTile(
    this.translationKey, {
    Key? key,
    this.widgets,
  }) : super(key: key);
  final String translationKey;
  final List<Widget>? widgets;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        translationKey.tr().toCapitalized(),
        style: context.textTheme.headline6!
            .copyWith(color: context.colors.onBackground),
      ),
      children: widgets ??
          [
            const SizedBox(
              height: 100,
            )
          ],
    );
  }
}