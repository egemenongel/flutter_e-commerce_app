import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Bag extends Equatable {
  const Bag({this.products = const <ProductModel>[]});

  final List<ProductModel> products;

  @override
  List<Object> get props => [products];
}
