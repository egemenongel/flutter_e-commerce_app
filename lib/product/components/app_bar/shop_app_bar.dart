import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

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
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.background,
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
      backgroundColor: context.colors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: context.colors.primary),
      titleTextStyle:
          context.textTheme.headline5!.copyWith(color: context.colors.primary),
      title: Center(
        child: Text(
          LocaleKeys.shop_title.tr(),
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

  Row _buildActions() {
    List<String> actionsList = [
      LocaleKeys.shop_sort_types_popular.tr().toTitleCase(),
      LocaleKeys.shop_sort_types_newest.tr().toTitleCase(),
      LocaleKeys.shop_sort_types_reviews.tr().toTitleCase(),
      LocaleKeys.shop_sort_types_price_low.tr(),
      LocaleKeys.shop_sort_types_price_high.tr()
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          width: 10,
        ),
        const Icon(Icons.sort),
        Text(actionsList[_selectedIndex]),
        const Spacer(),
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return _buildSheet(context, actionsList);
                  });
            },
            icon: const Icon(Icons.list))
      ],
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
              .map((action) => GestureDetector(
                    onTap: () {
                      _onTap(actionsList.indexOf(action));
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: context.paddingLowHorizontal,
                            height: 50,
                            color: actionsList.indexOf(action) == _selectedIndex
                                ? Colors.red
                                : Colors.white,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                action,
                                style: context.textTheme.bodyText1!.copyWith(
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
                  ))
              .toList(),
        ),
      ),
    );
  }
}
