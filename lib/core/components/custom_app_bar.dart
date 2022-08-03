import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight * 2),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  int _selectedIndex = 0;
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
      elevation: 0,
      backgroundColor: context.colors.onPrimary,
      iconTheme: IconThemeData(color: context.colors.primary),
      titleTextStyle:
          context.textTheme.headline5!.copyWith(color: context.colors.primary),
      title: Center(
        child: Text(
          'shop.title'.tr(),
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
      'shop.sort_types.popular'.tr().toTitleCase(),
      'shop.sort_types.newest'.tr().toTitleCase(),
      'shop.sort_types.reviews'.tr().toTitleCase(),
      'shop.sort_types.price_low'.tr(),
      'shop.sort_types.price_high'.tr()
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
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Sort by',
                            style: context.textTheme.headline5!.copyWith(),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Expanded(
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
                                                  padding: context
                                                      .paddingLowHorizontal,
                                                  height: 50,
                                                  color: actionsList.indexOf(
                                                              action) ==
                                                          _selectedIndex
                                                      ? Colors.red
                                                      : Colors.white,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      action,
                                                      style: context
                                                          .textTheme.bodyText1!
                                                          .copyWith(
                                                        color: actionsList
                                                                    .indexOf(
                                                                        action) ==
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
                          ),
                        ],
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.list))
      ],
    );
  }
}