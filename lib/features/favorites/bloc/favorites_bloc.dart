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
    on<FavoritesProductRemoved>(_onProductRemoved);
  }
  final _favProducts = <ProductModel>[];

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

  void removeItemFromFavorites(ProductModel product) {
    product.isFavorite = false;
    _favProducts.remove(product);
  }

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
            isProductUpdated: false,
          ),
        );
        emit(
          FavoritesLoaded(
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

  Future<void> _onProductRemoved(
      FavoritesProductRemoved event, Emitter<FavoritesState> emit) async {
    final state = this.state;
    if (state is FavoritesLoaded) {
      try {
        removeItemFromFavorites(event.product);
        emit(
          FavoritesLoaded(
            favoritesModel: FavoritesModel(
              products: [..._favProducts],
            ),
            isProductUpdated: false,
          ),
        );
        emit(
          FavoritesLoaded(
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
}
