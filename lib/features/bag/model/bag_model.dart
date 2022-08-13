import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:equatable/equatable.dart';

class BagModel extends Equatable {
  const BagModel({this.products = const <ProductModel>[]});

  final List<ProductModel> products;

  @override
  List<Object> get props => [products];
}
