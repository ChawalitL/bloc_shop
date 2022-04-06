import 'package:bloc_provider/bloc/app_bloc_observer.dart';
import 'package:bloc_provider/bloc/cart/cart_bloc.dart';
import 'package:bloc_provider/bloc/wishlist/wishlist_bloc.dart';
import 'package:bloc_provider/config/app_router.dart';
import 'package:bloc_provider/config/theme.dart';
import 'package:bloc_provider/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen/home/home_screen.dart';

void main() {
  
  // ของเก่าก่อนใช้ bloc_observer
  //runApp(const MyApp());

  // หลังเปลี่ยน
  BlocOverrides.runZoned(() {
    runApp(MyApp());
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: ((context) => WishlistBloc()..add(StartWishlist()))),
        BlocProvider(
            create: ((context) => CartBloc()..add(CartStarted()))),
      ],
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
