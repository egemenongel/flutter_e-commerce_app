part of 'bag_bloc.dart';

abstract class BagEvent extends Equatable {
  const BagEvent();

  @override
  List<Object> get props => [];
}

class BagInitialized extends BagEvent {
  @override
  List<Object> get props => [];
}

class BagProductAdded extends BagEvent {
  const BagProductAdded(this.product);
  final ProductModel product;

  @override
  List<Object> get props => [product];
}

class BagProductRemoved extends BagEvent {
  const BagProductRemoved(this.product);
  final ProductModel product;

  @override
  List<Object> get props => [product];
}

class BagProductIncremented extends BagEvent {
  const BagProductIncremented(this.product);
  final ProductModel product;

  @override
  List<Object> get props => [product];
}

class BagProductDecremented extends BagEvent {
  const BagProductDecremented(this.product);
  final ProductModel product;

  @override
  List<Object> get props => [product];
}
