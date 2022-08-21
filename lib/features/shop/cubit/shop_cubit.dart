import 'package:ecommerce_app/features/shop/service/shop_service.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(this.shopService) : super(const ShopState()) {
    //initState
    fetchAllProducts();
  }
  final ShopService shopService;
  int selectedIndex = 0;
  bool isGrid = true;
  final Map<String, dynamic> queryParameters = {};
  Future<void> fetchAllProducts({Map<String, dynamic>? params}) async {
    _changeLoading();
    final response = await shopService.fetchAllProducts(params: params);
    emit(state.copyWith(
      products: response ?? [],
    ));
    _changeLoading();
  }

  void selectIndex(int index) {
    selectedIndex = index;
    selectedIndex == 1 || selectedIndex == 3
        ? queryParameters.addAll({'sort': 'desc'})
        : queryParameters.addAll({'sort': 'asc'});
    emit(state.copyWith(selectedIndex: selectedIndex));
  }

  void changeView() {
    isGrid = !isGrid;
    emit(state.copyWith(isGrid: isGrid));
  }

  void _changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
