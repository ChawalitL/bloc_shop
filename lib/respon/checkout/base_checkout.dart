import 'package:bloc_provider/models/models.dart';

abstract class BaseCheckoutRespon {
  Future<void> addcheckout(Checkout checkout);
}