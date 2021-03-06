import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>(_onLoadToState);
    on<AddWishlistProduct>(_onAddProductToWishlist);
    on<RemoveWishlistProduct>(_onRemoveProductToWishlist);
  }

  void _onLoadToState(event, Emitter<WishlistState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(WishlistLoaded());
    } catch (e) {
      emit(WishlistError());
    }
  }

  void _onAddProductToWishlist(event, emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishlist: Wishlist(
                products: Set.from(state.wishlist.products)
                  ..add(event.product))));
      } catch (e) {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveProductToWishlist(event, emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: Set.from(state.wishlist.products)..remove(event.product),
            ),
          ),
        );
      } catch (e) {
        emit(WishlistError());
      }
    }
  }
}
