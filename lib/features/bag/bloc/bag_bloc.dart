import 'package:ecommerce_app/features/bag/model/bag.dart';
import 'package:ecommerce_app/product/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bag_event.dart';
part 'bag_state.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  BagBloc() : super(BagInitial()) {
    on<BagInitialized>(_onInitialized);
    on<BagProductAdded>(_onProductAdded);
    on<BagProductRemoved>(_onProductRemoved);
  }

  final _items = <ProductModel>[];
  void addItemToCart(ProductModel item) => _items.add(item);

  void removeItemFromCart(ProductModel item) => _items.remove(item);

  void _onInitialized(BagInitialized event, Emitter<BagState> emit) {
    emit(BagInitial());
    try {
      final items = _items;
      emit(BagLoaded(bag: Bag(products: [...items])));
    } catch (_) {
      emit(BagError());
    }
  }

  Future<void> _onProductAdded(
      BagProductAdded event, Emitter<BagState> emit) async {
    final state = this.state;
    if (state is BagLoaded) {
      try {
        addItemToCart(event.product);
        emit(BagLoaded(
            bag: Bag(products: [...state.bag.products, event.product])));
      } catch (_) {
        emit(BagError());
      }
    }
  }

  void _onProductRemoved(BagProductRemoved event, Emitter<BagState> emit) {
    final state = this.state;
    if (state is BagLoaded) {
      try {
        removeItemFromCart(event.product);
        emit(
          BagLoaded(
            bag: Bag(
              products: [...state.bag.products]..remove(event.product),
            ),
          ),
        );
      } catch (_) {
        emit(BagError());
      }
    }
  }
}
