import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final int price;
  final bool isRecommended;
  final bool isPopular;
  final String? des;

  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular,
      required this.des});

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular, des];

  static Product fromsnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
      name: snapshot['name'],
      category: snapshot['category'],
      imageUrl: snapshot['imageUrl'],
      price: snapshot['price'],
      isRecommended: snapshot['isRecommended'],
      isPopular: snapshot['isPopular'],
      des: snapshot['des'],
    );

    return product;
  }

  static List<Product> products = [
    Product(
        name: 'SoftDrink #1',
        category: 'SoftDrink',
        imageUrl:
            'https://ocs-k8s-prod.s3.ap-southeast-1.amazonaws.com/PRODUCT_1642667956513.jpeg',
        price: 250,
        isRecommended: false,
        isPopular: false,
        des: "information SoftDrink #1"),
    Product(
        name: 'SoftDrink #2',
        category: 'SoftDrink',
        imageUrl:
            'https://ocs-k8s-prod.s3.ap-southeast-1.amazonaws.com/PRODUCT_1618917141147.jpeg',
        price: 260,
        isRecommended: true,
        isPopular: false,
        des: "information SoftDrink #2"),
    Product(
        name: 'SoftDrink #3',
        category: 'SoftDrink',
        imageUrl:
            'https://ocs-k8s-prod.s3.ap-southeast-1.amazonaws.com/PRODUCT_1642667152564.jpeg',
        price: 100,
        isRecommended: true,
        isPopular: true,
        des: "information SoftDrink #3"),
    Product(
        name: 'Smoothies #1',
        category: 'Smoothies',
        imageUrl:
            'https://files.vogue.co.th/uploads/fresh-mango-smoothie_1339-1485.jpg',
        price: 80,
        isRecommended: true,
        isPopular: false,
        des: "information Smoothies #1"),
    Product(
        name: 'Smoothies #2',
        category: 'Smoothies',
        imageUrl: 'https://files.vogue.co.th/uploads/smoothies-Strawberry.jpg',
        price: 70,
        isRecommended: true,
        isPopular: true,
        des: "information Smoothies #2"),
    Product(
        name: 'Smoothies #3',
        category: 'Smoothies',
        imageUrl: 'https://files.vogue.co.th/uploads/smoothie8.jpg',
        price: 90,
        isRecommended: false,
        isPopular: false,
        des: "information Smoothies #3"),
    Product(
        name: 'Water #1',
        category: 'Water',
        imageUrl:
            'https://secure.ap-tescoassets.com/assets/TH/873/4001513000873/ShotType1_540x540.jpg',
        price: 110,
        isRecommended: false,
        isPopular: false,
        des: "information Water #1"),
    Product(
        name: 'Water #2',
        category: 'Water',
        imageUrl:
            'https://secure.ap-tescoassets.com/assets/TH/178/3057640100178/ShotType1_540x540.jpg',
        price: 70,
        isRecommended: false,
        isPopular: false,
        des: "information Water #2"),
    Product(
        name: 'Water #3',
        category: 'Water',
        imageUrl:
            'https://secure.ap-tescoassets.com/assets/TH/844/8000815004844/ShotType1_540x540.jpg',
        price: 70,
        isRecommended: false,
        isPopular: true,
        des: "information Water #3"),
  ];
}
