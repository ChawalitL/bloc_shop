part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String? name;
  final String? email;
  final String? address;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final Checkout checkout;

  CheckoutLoaded({
    required this.name,
    required this.email,
    required this.address,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  }) : checkout = Checkout(
          name: name,
          email: email,
          address: address,
          products: products,
          subtotal: subtotal,
          deliveryFee: deliveryFee,
          total: total,
        );

  @override
  List<Object?> get props =>
      [name, email, address, products, subtotal, deliveryFee, total];

}
