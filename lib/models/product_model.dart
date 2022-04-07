import 'package:bloc_provider/models/category_model.dart';
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
    Product products = Product(
      name: snapshot['name'],
      category: snapshot['category'],
      imageUrl: snapshot['imageUrl'],
      price: snapshot['price'],
      isRecommended: snapshot['isRecommended'],
      isPopular: snapshot['isPopular'],
      des: snapshot['des'],
    );

    return products;
  }

  static List<Product> products = const [
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
    Product(
      name: 'Smoothies #4',
      category: 'Smoothies',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/make-ahead-smoothies-1641852307.jpg?crop=0.544xw:0.817xh;0.162xw,0.127xh&resize=980:*',
      price: 90,
      isRecommended: false,
      isPopular: false,
      des: "information SoftDrink #4",
    ),
    Product(
      name: 'Smoothies #5',
      category: 'Smoothies',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/summer-smoothies-1641853036.jpg?crop=0.669xw:1.00xh;0.140xw,0&resize=980:*',
      price: 60,
      isRecommended: false,
      isPopular: false,
      des: "information SoftDrink #5",
    ),
    Product(
      name: 'Smoothies #6',
      category: 'Smoothies',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/pineapple-cucumber-smoothie-1641852612.jpg?crop=0.483xw:0.467xh;0.0842xw,0.362xh&resize=980:*',
      price: 100,
      isRecommended: false,
      isPopular: false,
      des: "information SoftDrink #6",
    ),
    Product(
      name: 'Smoothies #7',
      category: 'Smoothies',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/coconut-raspberry-smoothie-1641852442.jpg?crop=0.665xw:1.00xh;0.199xw,0&resize=980:*',
      price: 90,
      isRecommended: false,
      isPopular: false,
      des: "information SoftDrink #7",
    ),
    Product(
      name: 'SoftDrink #4',
      category: 'SoftDrink',
      imageUrl:
          'https://ocs-k8s-prod.s3.ap-southeast-1.amazonaws.com/PRODUCT_1642565569625.jpeg',
      price: 120,
      isRecommended: false,
      isPopular: false,
      des: "information SoftDrink #4",
    ),
    Product(
      name: 'SoftDrink #5',
      category: 'SoftDrink',
      imageUrl:
          'https://ocs-k8s-prod.s3.ap-southeast-1.amazonaws.com/PRODUCT_1642668555971.jpeg',
      price: 150,
      isRecommended: false,
      isPopular: false,
      des: "information SoftDrink #5",
    ),
    Product(
      name: 'SoftDrink #6',
      category: 'SoftDrink',
      imageUrl:
          'https://ocs-k8s-prod.s3.ap-southeast-1.amazonaws.com/PRODUCT_1642669184445.jpeg',
      price: 140,
      isRecommended: false,
      isPopular: false,
      des: "information SoftDrink #6",
    ),
  ];
}
