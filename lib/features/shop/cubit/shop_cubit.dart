import 'package:ecommerce_app/features/shop/service/shop_service.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(this.shopService) : super(const ShopState()) {
    fetchAllProducts();
  }
  final ShopService shopService;

  Future<void> fetchAllProducts() async {
    _changeLoading();
    final response = await shopService.fetchAllProducts();

    emit(state.copyWith(
      products: response ?? [],
    ));
    _changeLoading();
  }

  void _changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
