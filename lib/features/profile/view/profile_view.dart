import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/components/header_text.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/core/utils/theme/cubit/theme_cubit.dart';
import 'package:ecommerce_app/core/components/buttons/primary_expansion_tile.dart';
import 'package:ecommerce_app/features/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(const ProfileInitialized()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTitle(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileTile(context),
                      ..._buildTiles(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  HeaderText _buildTitle(BuildContext context) =>
      const HeaderText(translationKey: LocaleKeys.profile_title);

  BlocBuilder _buildProfileTile(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoad) {
          return SizedBox(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: context.colors.onPrimary,
                backgroundImage: const AssetImage(AssetPaths.profileImage),
                radius: 30,
              ),
              title: Text(
                '${state.profileModel!.name!.firstname.toString().toTitleCase()} ${state.profileModel!.name!.lastname.toString().toTitleCase()}', // LocaleKeys.common_placeholder_name.tr().toTitleCase(),
                style: context.textTheme.headline6!
                    .copyWith(color: context.colors.onBackground),
              ),
              subtitle: Text(
                state.profileModel!.email!,
                style: context.textTheme.caption!
                    .copyWith(color: context.colors.onBackground),
              ),
            ),
          );
        }
        if (state is ProfileError) {
          return const Text('ERROR');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  List<Widget> _buildTiles(BuildContext context) {
    return [
      const PrimaryExpansionTile(
        LocaleKeys.profile_orders,
      ),
      _buildAddressTile(),
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

  BlocBuilder _buildAddressTile() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoad) {
          return PrimaryExpansionTile(
            LocaleKeys.profile_addresses,
            widgets: [
              SizedBox(
                height: 150,
                child: Card(
                  color: context.colors.primary,
                  child: Padding(
                    padding: context.paddingLow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Home',
                                style: context.textTheme.headline6!.copyWith(),
                              ),
                              Text('${state.profileModel!.address!.city}'
                                  .toTitleCase()),
                              Text('${state.profileModel!.address!.street}'
                                  .toTitleCase()),
                              Text('${state.profileModel!.address!.number}'
                                  .toTitleCase()),
                              Text('${state.profileModel!.address!.zipcode}'
                                  .toTitleCase()),
                              Text(
                                'Telefon: ${state.profileModel!.phone!}',
                                style: context.textTheme.bodyText2!.copyWith(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          );
        } else if (state is ProfileError) {
          return const Text('Error');
        }
        return const CircularProgressIndicator();
      },
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
