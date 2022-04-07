import 'package:bloc_provider/models/category_model.dart';
import 'package:bloc_provider/respon/category/base_catagory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryRes extends BaseCatagoryRespon {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRes({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllcategories() {
    return _firebaseFirestore.collection('catagories').snapshots().map((event) {
      return event.docs.map((e) => Category.fromsnapshot(e)).toList();
    });
  }
}
