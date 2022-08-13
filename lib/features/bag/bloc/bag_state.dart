part of 'bag_bloc.dart';

abstract class BagState extends Equatable {
  const BagState();

  @override
  List<Object> get props => [];
}

class BagInitial extends BagState {
  @override
  List<Object> get props => [];
}

class BagLoaded extends BagState {
  const BagLoaded({this.bag = const Bag(), this.isProductUpdated = false});
  final bool isProductUpdated;
  final Bag bag;

  @override
  List<Object> get props => [bag, isProductUpdated];
}

class BagError extends BagState {
  @override
  List<Object> get props => [];
}
