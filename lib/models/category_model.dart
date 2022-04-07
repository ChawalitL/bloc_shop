import 'package:cloud_firestore/cloud_firestore.dart';
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

  static Category fromsnapshop(DocumentSnapshot snapshot) {
    Category category = Category(
      name: snapshot['name'],
      imageUrl: snapshot['imageUrl'],
    );

    return category;
  }

}
