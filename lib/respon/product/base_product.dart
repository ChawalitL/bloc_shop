import 'package:bloc_provider/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseProductRespon {
  Stream<List<Product>> getAllproduct();
}
