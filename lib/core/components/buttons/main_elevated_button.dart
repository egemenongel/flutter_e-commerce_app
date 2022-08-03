import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MainElevatedButton extends StatelessWidget {
  MainElevatedButton({
    Key? key,
    required this.onPressed,
    required this.localizationKey,
  }) : super(key: key);

  VoidCallback onPressed;
  String localizationKey;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
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
