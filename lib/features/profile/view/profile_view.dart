import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/components/header_text.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/core/utils/theme/cubit/theme_cubit.dart';
import 'package:ecommerce_app/core/components/buttons/primary_expansion_tile.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              _buildProfileTile(context),
              ..._buildTiles(context),
            ],
          ),
        ),
      ),
    );
  }

  HeaderText _buildTitle(BuildContext context) =>
      HeaderText(translationKey: LocaleKeys.profile_title.tr().toTitleCase());

  SizedBox _buildProfileTile(BuildContext context) {
    return SizedBox(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: context.colors.onPrimary,
          backgroundImage: const AssetImage(AssetPaths.profileImage),
          radius: 30,
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
      ),
    );
  }

  List<Widget> _buildTiles(BuildContext context) {
    return [
      const PrimaryExpansionTile(
        LocaleKeys.profile_orders,
      ),
      const PrimaryExpansionTile(LocaleKeys.profile_addresses),
      const PrimaryExpansionTile(LocaleKeys.profile_methods),
      const PrimaryExpansionTile(LocaleKeys.profile_codes),
      const PrimaryExpansionTile(LocaleKeys.profile_reviews),
      PrimaryExpansionTile(
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
    ];
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
