part of 'shop_cubit.dart';

class ShopState extends Equatable {
  const ShopState({
    this.products,
    this.isLoading,
  });

  final List<ProductModel>? products;
  final bool? isLoading;

  ShopState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
  }) {
    return ShopState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [products, isLoading];
}
