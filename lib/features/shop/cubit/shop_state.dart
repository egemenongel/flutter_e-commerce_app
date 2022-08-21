part of 'shop_cubit.dart';

class ShopState extends Equatable {
  const ShopState({
    this.products,
    this.isLoading,
    this.selectedIndex,
    this.isGrid = true,
  });

  final List<ProductModel>? products;
  final bool? isLoading;
  final int? selectedIndex;
  final bool isGrid;

  ShopState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
    int? selectedIndex,
    bool? isGrid,
  }) {
    return ShopState(
        products: products ?? this.products,
        isLoading: isLoading ?? this.isLoading,
        selectedIndex: selectedIndex ?? this.selectedIndex,
        isGrid: isGrid ?? this.isGrid);
  }

  @override
  List<Object?> get props => [products, isLoading, selectedIndex, isGrid];
}
