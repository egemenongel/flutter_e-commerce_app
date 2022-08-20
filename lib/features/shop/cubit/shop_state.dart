part of 'shop_cubit.dart';

class ShopState extends Equatable {
  const ShopState({
    this.products,
    this.isLoading,
    this.selectedIndex,
  });

  final List<ProductModel>? products;
  final bool? isLoading;
  final int? selectedIndex;

  ShopState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
    int? selectedIndex,
  }) {
    return ShopState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [products, isLoading, selectedIndex];
}
