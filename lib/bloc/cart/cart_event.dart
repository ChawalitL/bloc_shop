part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {

}

class CartProductAdd extends CartEvent {
  final Product product;

  const CartProductAdd(this.product);
  @override
  List<Object> get props => [product];
}

class CartProductRemove extends CartEvent {
  final Product product;

  const CartProductRemove(this.product);
  @override
  List<Object> get props => [product];
}