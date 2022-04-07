import 'package:bloc_provider/models/models.dart';

abstract class BaseProductRespon {
  Stream<List<Product>> getAllproduct();
}
