import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/features/bag/view/bag_view.dart';
import 'package:ecommerce_app/features/favorites/view/favorites_view.dart';
import 'package:ecommerce_app/features/home/view/home_view.dart';
import 'package:ecommerce_app/features/profile/view/profile_view.dart';
import 'package:ecommerce_app/features/shop/view/shop_view.dart';

import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);
  static const id = '/';
  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _navItems = <Widget>[
    HomeView(),
    ShopView(),
    BagView(),
    FavoritesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navItems[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: LocaleKeys.common_nav_home.tr().toTitleCase(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: LocaleKeys.common_nav_shop.tr().toTitleCase(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_bag),
              label: LocaleKeys.common_nav_bag.tr().toTitleCase(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: LocaleKeys.common_nav_favorites.tr().toTitleCase(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: LocaleKeys.common_nav_profile.tr().toTitleCase(),
            ),
          ]),
    );
  }
}
