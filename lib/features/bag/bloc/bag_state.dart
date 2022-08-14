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

class BagLoad extends BagState {
  const BagLoad(
      {this.bag = const BagModel(),
      this.isProductUpdated = false,
      this.totalPrice = 0});
  final bool isProductUpdated;
  final BagModel bag;
  final double totalPrice;

  @override
  List<Object> get props => [bag, isProductUpdated];
}

class BagError extends BagState {
  @override
  List<Object> get props => [];
}
