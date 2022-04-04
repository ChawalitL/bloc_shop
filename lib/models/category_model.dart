import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    Category(
        name: 'Smoothies',
        imageUrl:
            'https://wholefully.com/wp-content/uploads/2016/01/three-colorful-fruit-smoothies.jpg'),
    Category(
        name: 'SoftDrink',
        imageUrl:
            'https://www.eatthis.com/wp-content/uploads/sites/4/2020/12/soda.jpg?quality=82&strip=1&w=640'),
    Category(
        name: 'Water',
        imageUrl: 'https://lux.co.th/wp-content/uploads/2018/11/image1.png'),
  ];
}
