import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/core/utils/theme/cubit/theme_cubit.dart';
import 'package:ecommerce_app/product/components/profile_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTitle(context),
              _buildProfileTile(context),
              ...[
                const ProfileExpansionTile(
                  LocaleKeys.profile_orders,
                ),
                const ProfileExpansionTile(LocaleKeys.profile_addresses),
                const ProfileExpansionTile(LocaleKeys.profile_methods),
                const ProfileExpansionTile(LocaleKeys.profile_codes),
                const ProfileExpansionTile(LocaleKeys.profile_reviews),
                ProfileExpansionTile(
                  LocaleKeys.profile_settings,
                  widgets: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.profile_theme.tr().toTitleCase(),
                          style: context.textTheme.bodyText2!
                              .copyWith(color: context.colors.onBackground),
                        ),
                        _buildThemeButton(),
                      ],
                    ),
                  ],
                )
              ],
            ],
          ),
        ),
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      LocaleKeys.profile_title.tr(),
      style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  ListTile _buildProfileTile(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: context.colors.primary,
        child: const Icon(Icons.person),
      ),
      title: Text(
        LocaleKeys.common_placeholder_name.tr().toTitleCase(),
        style: context.textTheme.headline6!
            .copyWith(color: context.colors.onBackground),
      ),
      subtitle: Text(
        LocaleKeys.common_placeholder_mail.tr().toLowerCase(),
        style: context.textTheme.caption!
            .copyWith(color: context.colors.onBackground),
      ),
    );
  }

  BlocBuilder<ThemeCubit, ThemeState> _buildThemeButton() {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Switch(
          value: state.isDark,
          onChanged: (newValue) {
            context.read<ThemeCubit>().toggleSwitch(newValue);
          },
        );
      },
    );
  }
}
