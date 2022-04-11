import 'package:bloc_provider/models/models.dart';
import 'package:bloc_provider/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product/product_bloc.dart';
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

    // ไม่ได้เชื่อม Firebase
    /*final List<Product> catagoryProducts =
        Product.products.where((i) => i.category == category.name).toList();*/

    return Scaffold(
      appBar: CustomAppbar(title: category.name),
      bottomNavigationBar: CustomNavigationBar(),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductLoaded) {
            // product.category == //widget.//category ที่รับค่าเข้ามา 
            final categoryProduct = state.products.where((i) => i.category == category.name).toList();
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.15),
                itemCount: categoryProduct.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                      child: ProductCard(
                    products: categoryProduct[index],
                  ));
                });
          } else {
            return Text('Somthing Wrong');
          }
        },
      ),
    );
  }
}
