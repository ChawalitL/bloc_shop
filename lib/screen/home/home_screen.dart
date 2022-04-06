// ignore_for_file: prefer_const_constructors

import 'package:bloc_provider/models/models.dart';
import 'package:bloc_provider/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => MyHomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'MY SHOP'),
      bottomNavigationBar: CustomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height),
                  items: Category.categories
                      .map((e) => HeroCarouselCard(category: e,product: null,))
                      .toList()),
            ),
            SectionTitle(title: 'RECOMMENDED'),
            ProductCarousel(
                products:
                    Product.products.where((i) => i.isRecommended).toList()
            ),
            SectionTitle(title: 'MOSTPOPULAR'),
            ProductCarousel(
                products:
                    Product.products.where((i) => i.isPopular).toList()
            ),
          ],
        ),
      ),
    );
  }
}
