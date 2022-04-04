import 'package:bloc/bloc.dart';
import 'package:bloc_provider/models/models.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_mapCartStartedToState);
    on<CartProductAdd>(_mapCartProductAddToState);
    on<CartProductRemove>(_mapCartProductRemoveToState);
  }

  void _mapCartStartedToState(event, emit) async {
    emit(CartLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(const CartLoaded());
    } catch (e) {
      emit(CartError());
    }
  }

  void _mapCartProductAddToState(event, emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    } else {}
  }

  void _mapCartProductRemoveToState(event, emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    } else {}
  }
}
