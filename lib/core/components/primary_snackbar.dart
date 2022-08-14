import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:flutter/material.dart';

class PrimarySnackbar {
  static show(BuildContext context, String translationKey) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
            SnackBar(content: Text(translationKey.tr().toCapitalized())));
}
