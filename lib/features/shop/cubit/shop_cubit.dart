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

  int _selectedIndex = 0;
  int get index => _selectedIndex;

  bool _isGrid = true;

  final Map<String, dynamic> _queryParameters = {};
  Map<String, dynamic> get parameters => _queryParameters;

  Future<void> fetchAllProducts({Map<String, dynamic>? params}) async {
    _changeLoading();
    final response = await shopService.fetchAllProducts(params: params);
    emit(state.copyWith(
      products: response ?? [],
    ));
    _changeLoading();
  }

  void selectIndex(int index) {
    _selectedIndex = index;
    _selectedIndex == 1 || _selectedIndex == 3
        ? _queryParameters.addAll({'sort': 'desc'})
        : _queryParameters.addAll({'sort': 'asc'});
    emit(state.copyWith(selectedIndex: _selectedIndex));
  }

  void changeView() {
    _isGrid = !_isGrid;
    emit(state.copyWith(isGrid: _isGrid));
  }

  void _changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
