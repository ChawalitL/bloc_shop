import 'package:bloc_provider/models/models.dart';
import 'package:bloc_provider/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class CatalogPage extends StatelessWidget {
  CatalogPage({Key? key, required this.category}) : super(key: key);

  final category;

  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogPage(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> catagoryProducts =
        Product.products.where((i) => i.category == category.name).toList();

    return Scaffold(
      appBar: CustomAppbar(title: category.name),
      bottomNavigationBar: CustomNavigationBar(),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemCount: catagoryProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: ProductCard(
              products: catagoryProducts[index],
            ));
          }),
    );
  }
}
