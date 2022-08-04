import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
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
      body: _navItems.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'common.nav.home'.tr().toTitleCase(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart_outlined),
              label: 'common.nav.shop'.tr().toTitleCase(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_bag_outlined),
              label: 'common.nav.bag'.tr().toTitleCase(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border),
              label: 'common.nav.favorites'.tr().toTitleCase(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline_outlined),
              label: 'common.nav.profile'.tr().toTitleCase(),
            ),
          ]),
    );
  }
}
