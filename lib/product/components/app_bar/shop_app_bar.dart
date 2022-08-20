import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/features/shop/cubit/shop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ShopAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight * 2),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  ShopAppBarState createState() => ShopAppBarState();
}

class ShopAppBarState extends State<ShopAppBar> {
  int _selectedIndex = 0;
  Map<String, dynamic> queryParameters = {};
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _selectedIndex == 1 || _selectedIndex == 3
        ? queryParameters.addAll({'sort': 'desc'})
        : queryParameters.addAll({'sort': 'asc'});
  }

  final List<String> actionsList = [
    LocaleKeys.shop_sort_types_popular.tr().toTitleCase(),
    LocaleKeys.shop_sort_types_newest.tr().toTitleCase(),
    LocaleKeys.shop_sort_types_reviews.tr().toTitleCase(),
    LocaleKeys.shop_sort_types_price_low.tr(),
    LocaleKeys.shop_sort_types_price_high.tr()
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.secondary,
      elevation: 5,
      child: Column(
        children: [
          _buildHeader(context),
          _buildActions(),
        ],
      ),
    );
  }

  AppBar _buildHeader(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.secondary,
      elevation: 0,
      iconTheme: IconThemeData(color: context.colors.onPrimary),
      titleTextStyle: context.textTheme.headline5!
          .copyWith(color: context.colors.onPrimary),
      title: Center(
        child: Text(
          LocaleKeys.shop_title.tr().toTitleCase(),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ))
      ],
    );
  }

  Container _buildActions() {
    return Container(
      color: context.colors.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.sort,
            color: context.colors.onBackground,
          ),
          Text(
            actionsList[_selectedIndex],
            style: TextStyle(
              color: context.colors.onBackground,
            ),
          ),
          const Spacer(),
          IconButton(
              color: context.colors.onBackground,
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return _buildSheet(context, actionsList);
                    });
              },
              icon: const Icon(Icons.list))
        ],
      ),
    );
  }

  Container _buildSheet(BuildContext context, List<String> actionsList) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          _buildSheetTitle(context),
          const SizedBox(
            height: 40,
          ),
          _buildSortTypes(actionsList, context),
        ],
      ),
    );
  }

  Text _buildSheetTitle(BuildContext context) {
    return Text(
      LocaleKeys.shop_sort.tr().toTitleCase(),
      style: context.textTheme.headline5!.copyWith(),
    );
  }

  Expanded _buildSortTypes(List<String> actionsList, BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: actionsList
              .map((action) => BlocBuilder<ShopCubit, ShopState>(
                    builder: (context, state) {
                      return BlocProvider.value(
                        value: BlocProvider.of<ShopCubit>(context),
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            _onTap(actionsList.indexOf(action));
                            await context
                                .read<ShopCubit>()
                                .sortProducts(queryParameters);
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: context.paddingLowHorizontal,
                                  height: 50,
                                  color: actionsList.indexOf(action) ==
                                          _selectedIndex
                                      ? Colors.red
                                      : Colors.white,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      action,
                                      style:
                                          context.textTheme.bodyText1!.copyWith(
                                        color: actionsList.indexOf(action) ==
                                                _selectedIndex
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
