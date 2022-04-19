import 'package:bloc_provider/models/models.dart';
import 'package:equatable/equatable.dart';

class Wishlist extends Equatable {
  final List<Product> products;

  const Wishlist({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];

  Map productWishlist(products) {
    var productWishlish = {};

    products.forEach((productKey) {
      if (!productWishlish.containsKey(productKey)) {
        productWishlish[productKey] = 1;
      } else {}
    });

    return productWishlish;
  }
}
