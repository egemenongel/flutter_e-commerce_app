import 'package:ecommerce_app/core/base/view/base_view.dart';
import 'package:flutter/cupertino.dart';

class NavigationManager {
  static final routes = <String, Widget Function(BuildContext)>{
    '/': (context) => const BaseView(),
  };
}
