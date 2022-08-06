import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/utils/lang/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              LocaleKeys.profile_title.tr(),
              style: context.textTheme.headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const ListTile(
              leading: CircleAvatar(),
              title: Text('Name'),
              subtitle: Text('Mail'),
            ),
          ],
        ),
      ),
    );
  }
}