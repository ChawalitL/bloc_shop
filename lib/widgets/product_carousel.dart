import 'package:flutter/material.dart';

import '../models/models.dart';
import 'widgets.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;

  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(right: 5),
                child: ProductCard(products: products[index]));
          }),
    );
  }
}
