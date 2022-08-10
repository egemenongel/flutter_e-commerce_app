import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/core/utils/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return Switch(
                  value: state.isDark,
                  onChanged: (newValue) {
                    context.read<ThemeCubit>().toggleSwitch(newValue);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
