import 'package:bloc_provider/bloc/wishlist/wishlist_bloc.dart';
import 'package:bloc_provider/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';

class WishlistPage extends StatelessWidget {
  WishlistPage({Key? key}) : super(key: key);

  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => WishlistPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'wishlist'),
      bottomNavigationBar: const CustomNavigationBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          print(state);
          if (state is WishlistLoading) {
            return const Center(child: CircularProgressIndicator()
                /*Text(
                'Not found Product',
                style: TextStyle(
                  fontSize: 30
                ),
              ),*/
                );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.4,
                ),
                itemCount: state.wishlist.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                      child: ProductCard(
                    products: state.wishlist.products[index],
                    widthFactor: 1.1,
                    leftPosition: 100,
                    isWishlist: true,
                  ));
                });
          } else {
            return Center(
              child: Text(
                'Error',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
