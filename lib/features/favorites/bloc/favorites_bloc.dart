import 'package:ecommerce_app/features/favorites/model/favorites_model.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<FavoritesInitialized>(_onInitialized);
    on<FavoritesProductAdded>(_onProductAdded);
    on<FavoritesProductRemoved>(_onProductRemoved);
  }
  final _favProducts = <ProductModel>[];

  void _onInitialized(
      FavoritesInitialized event, Emitter<FavoritesState> emit) {
    emit(FavoritesInitial());
    try {
      final items = _favProducts;
      emit(FavoritesLoad(favoritesModel: FavoritesModel(products: [...items])));
    } catch (_) {
      emit(FavoritesError());
    }
  }

  Future<void> _onProductAdded(
      FavoritesProductAdded event, Emitter<FavoritesState> emit) async {
    final state = this.state;
    if (state is FavoritesLoad) {
      try {
        addItemToFavorites(event.product);
        emit(
          FavoritesLoad(
            favoritesModel: FavoritesModel(
              products: [..._favProducts],
            ),
            isProductUpdated: false,
          ),
        );
        emit(
          FavoritesLoad(
            favoritesModel: FavoritesModel(
              products: [..._favProducts],
            ),
            isProductUpdated: true,
          ),
        );
      } catch (_) {
        emit(FavoritesError());
      }
    }
  }

  void addItemToFavorites(ProductModel product) {
    product.isFavorite = true;
    if (!isProductInFavorites(product)) {
      _favProducts.add(product);
    }
  }

  bool isProductInFavorites(ProductModel product) {
    return _favProducts
        .any((checkedProduct) => checkedProduct.title == product.title);
  }

  Future<void> _onProductRemoved(
      FavoritesProductRemoved event, Emitter<FavoritesState> emit) async {
    final state = this.state;
    if (state is FavoritesLoad) {
      try {
        removeItemFromFavorites(event.product);
        emit(
          FavoritesLoad(
            favoritesModel: FavoritesModel(
              products: [..._favProducts],
            ),
            isProductUpdated: false,
          ),
        );
        emit(
          FavoritesLoad(
            favoritesModel: FavoritesModel(
              products: [..._favProducts],
            ),
            isProductUpdated: true,
          ),
        );
      } catch (_) {
        emit(FavoritesError());
      }
    }
  }

  void removeItemFromFavorites(ProductModel product) {
    product.isFavorite = false;
    _favProducts.remove(product);
  }
}
