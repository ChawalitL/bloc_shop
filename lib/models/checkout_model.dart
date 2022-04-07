import 'package:equatable/equatable.dart';

import 'product_model.dart';

class Checkout extends Equatable {
  final String? name;
  final String? email;
  final String? address;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  Checkout({
    required this.name,
    required this.email,
    required this.address,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  List<Object?> get props =>
      [name, email, address, products, subtotal, deliveryFee, total];

  Map<String, dynamic> toDocument() {
    return {
      'customerName' : name,
      'customerEmail' : email!,
      'customerAddress' : address!,
      'products' : products!.map((e) => e.name).toList(),
      'subtotal' : subtotal!,
      'deliveryFee' : deliveryFee!,
      'total' : total!,
    };
  }
}
