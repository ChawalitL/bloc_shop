import 'package:bloc_provider/bloc/cart/cart_bloc.dart';
import 'package:bloc_provider/bloc/wishlist/wishlist_bloc.dart';
import 'package:bloc_provider/config/app_router.dart';
import 'package:bloc_provider/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => WishlistBloc()..add(StartWishlist()))),
        BlocProvider(create: ((context) => CartBloc()..add(CartStarted()))),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: MyHomePage.routeName,
      ),
    );
  }
}
