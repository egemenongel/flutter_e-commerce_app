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
    on<BagProductIncremented>(_onProductIncremented);
    on<BagProductDecremented>(_onProductDecremented);
  }

  final _items = <ProductModel>[];
  void addItemToCart(ProductModel product) {
    if (isProductInCart(product)) {
      incrementProduct(product);
    } else {
      _items.add(product);
    }
  }

  bool isProductInCart(ProductModel product) {
    return _items
        .any((checkedProduct) => checkedProduct.title == product.title);
  }

  void removeItemFromCart(ProductModel product) => _items.remove(product);

  void _onInitialized(BagInitialized event, Emitter<BagState> emit) {
    emit(BagInitial());
    try {
      final items = _items;
      emit(BagLoaded(bag: Bag(products: [...items])));
    } catch (_) {
      emit(BagError());
    }
  }

  void incrementProduct(ProductModel product) {
    product.count++;
  }

  void decrementProduct(ProductModel product) {
    if (product.count > 1) {
    } else {
      _items.remove(product);
    }
  }

  Future<void> _onProductIncremented(
      BagProductIncremented event, Emitter<BagState> emit) async {
    final state = this.state;
    if (state is BagLoaded) {
      try {
        incrementProduct(event.product);
        emit(
          BagLoaded(
            bag: Bag(
              products: [..._items],
            ),
            isProductUpdated: false,
          ),
        );
        emit(
          BagLoaded(
            bag: Bag(
              products: [..._items],
            ),
            isProductUpdated: true,
          ),
        );
      } catch (_) {
        emit(BagError());
      }
    }
  }

  Future<void> _onProductDecremented(
      BagProductDecremented event, Emitter<BagState> emit) async {
    final state = this.state;
    if (state is BagLoaded) {
      try {
        decrementProduct(event.product);
        emit(
          BagLoaded(
            bag: Bag(
              products: [..._items],
            ),
            isProductUpdated: false,
          ),
        );
        emit(
          BagLoaded(
            bag: Bag(
              products: [..._items],
            ),
            isProductUpdated: true,
          ),
        );
      } catch (_) {
        emit(BagError());
      }
    }
  }

  Future<void> _onProductAdded(
      BagProductAdded event, Emitter<BagState> emit) async {
    final state = this.state;
    if (state is BagLoaded) {
      try {
        addItemToCart(event.product);
        emit(
          const BagLoaded(
            isProductUpdated: false,
          ),
        );
        emit(
          BagLoaded(
            bag: Bag(
              products: [..._items],
            ),
            isProductUpdated: true,
          ),
        );
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