import 'package:bloc_provider/screen/screen.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case '/':
        return MyHomePage.route();

      case SplashScreen.routeName:
        return SplashScreen.route();

      case CartPage.routeName:
        return CartPage.route();

      case ProductPage.routeName:
        return ProductPage.route(product: settings.arguments as Product);

      case CatalogPage.routeName:
        return CatalogPage.route(category: settings.arguments as Category);

      case WishlistPage.routeName:
        return WishlistPage.route();

      case CheckoutPage.routeName:
        return CheckoutPage.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Error',
          ),
        ),
      ),
    );
  }
}
