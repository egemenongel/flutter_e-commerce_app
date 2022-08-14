import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PrimaryElevatedButton extends StatelessWidget {
  const PrimaryElevatedButton({
    Key? key,
    required this.onPressed,
    required this.localizationKey,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String localizationKey;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(context.colors.primary),
                backgroundColor:
                    MaterialStateProperty.all(context.colors.onPrimary),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
                padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
              ),
              child: Text(localizationKey.tr().toUpperCase())),
        ),
      ],
    );
  }
}
