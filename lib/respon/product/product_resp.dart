import 'package:bloc_provider/models/category_model.dart';
import 'package:bloc_provider/models/product_model.dart';
import 'package:bloc_provider/respon/product/base_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRes extends BaseProductRespon {
  final FirebaseFirestore _firebaseFirestore;

  ProductRes({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllproduct() {
    return _firebaseFirestore.collection('products').snapshots().map((event) {
      return event.docs.map((e) => Product.fromSnapshot(e)).toList();
    });
  }

}
