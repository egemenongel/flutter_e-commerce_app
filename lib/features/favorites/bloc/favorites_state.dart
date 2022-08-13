part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {
  @override
  List<Object> get props => [];
}

class FavoritesLoaded extends FavoritesState {
  const FavoritesLoaded(
      {this.favoritesModel = const FavoritesModel(), this.totalPrice = 0});

  final FavoritesModel favoritesModel;
  final double totalPrice;

  @override
  List<Object> get props => [favoritesModel];
}

class FavoritesError extends FavoritesState {
  @override
  List<Object> get props => [];
}
