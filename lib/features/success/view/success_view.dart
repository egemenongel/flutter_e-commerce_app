import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/components/buttons/primary_elevated_button.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({Key? key}) : super(key: key);
  static const id = '/success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AssetPaths.successImage,
          fit: BoxFit.fill,
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
                height: 50,
                child: FittedBox(
                    child: Text(
                  LocaleKeys.success_title.tr().toTitleCase(),
                  style: context.textTheme.headline6!.copyWith(),
                ))),
            SizedBox(
              height: 50,
              width: context.width * (3 / 4),
              child: FittedBox(
                  child: Text(
                LocaleKeys.success_thanks,
                style: context.textTheme.bodyText1!.copyWith(),
              ).tr()),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: context.paddingHighHorizontal,
              child: PrimaryElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                localizationKey: LocaleKeys.common_buttons_continue_shopping,
              ),
            )
          ],
        )
      ],
    ));
  }
}
