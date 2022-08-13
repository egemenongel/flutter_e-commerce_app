part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesInitialized extends FavoritesEvent {
  @override
  List<Object> get props => [];
}

class FavoritesProductAdded extends FavoritesEvent {
  const FavoritesProductAdded(this.product);
  final ProductModel product;

  @override
  List<Object> get props => [product];
}

class FavoritesProductRemoved extends FavoritesEvent {
  const FavoritesProductRemoved(this.product);
  final ProductModel product;

  @override
  List<Object> get props => [product];
}
