import 'package:ecommerce_app/core/base/view/base_view.dart';
import 'package:ecommerce_app/features/success/view/success_view.dart';
import 'package:flutter/cupertino.dart';

class NavigationManager {
  static final routes = <String, Widget Function(BuildContext)>{
    BaseView.id: (context) => const BaseView(),
    SuccessView.id: (context) => const SuccessView(),
    // ProductDetailView.id: (context) => const ProductDetailView(),
  };
}
