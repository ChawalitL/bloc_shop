import 'package:bloc_provider/models/checkout_model.dart';
import 'package:bloc_provider/respon/checkout/base_checkout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckoutRes extends BaseCheckoutRespon {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRes({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addcheckout(Checkout checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}
