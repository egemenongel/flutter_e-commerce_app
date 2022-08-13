import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/favorites/model/favorites_model.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<FavoritesInitialized>(_onInitialized);
    on<FavoritesProductAdded>(_onProductAdded);
  }
  final _favProducts = <ProductModel>[];

  void addItemToFavorites(ProductModel product) {
    if (!isProductInFavorites(product)) {
      _favProducts.add(product);
    } else {
      removeItemFromCart(product);
    }
  }

  bool isProductInFavorites(ProductModel product) {
    return _favProducts
        .any((checkedProduct) => checkedProduct.title == product.title);
  }

  void removeItemFromCart(ProductModel product) => _favProducts.remove(product);

  void _onInitialized(
      FavoritesInitialized event, Emitter<FavoritesState> emit) {
    emit(FavoritesInitial());
    try {
      final items = _favProducts;
      emit(FavoritesLoaded(
          favoritesModel: FavoritesModel(products: [...items])));
    } catch (_) {
      emit(FavoritesError());
    }
  }

  Future<void> _onProductAdded(
      FavoritesProductAdded event, Emitter<FavoritesState> emit) async {
    final state = this.state;
    if (state is FavoritesLoaded) {
      try {
        addItemToFavorites(event.product);
        emit(
          FavoritesLoaded(
            favoritesModel: FavoritesModel(
              products: [..._favProducts],
            ),
          ),
        );
      } catch (_) {
        emit(FavoritesError());
      }
    }
  }
}
