import 'package:bloc_provider/bloc/app_bloc_observer.dart';
import 'package:bloc_provider/bloc/cart/cart_bloc.dart';
import 'package:bloc_provider/bloc/category/category_bloc.dart';
//import 'package:bloc_provider/bloc/product/product_bloc.dart';
import 'package:bloc_provider/bloc/wishlist/wishlist_bloc.dart';
import 'package:bloc_provider/config/app_router.dart';
import 'package:bloc_provider/config/theme.dart';
import 'package:bloc_provider/respon/category/catagory_resp.dart';
import 'package:bloc_provider/respon/product/product_resp.dart';
import 'package:bloc_provider/screen/screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product/product_bloc.dart';

Future<void> main() async {
  // ของเก่าก่อนใช้ bloc_observer
  //runApp(const MyApp());

  // หลังเปลี่ยน
  BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

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
          create: ((context) => WishlistBloc()..add(StartWishlist())),
        ),
        BlocProvider(
          create: ((context) => CartBloc()..add(CartStarted())),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(categoryRes: CategoryRes())..add(LoadCategories()),
        ),
        BlocProvider(
          create: (context) => ProductBloc(productRes: ProductRes())..add(LoadProducts()),
        ),
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
