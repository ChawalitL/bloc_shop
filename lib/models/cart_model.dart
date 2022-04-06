import 'package:equatable/equatable.dart';
import 'models.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  // รวมค่า subtotal
  double get subtotal => products.fold(0, (total, item) => total + item.price);

  // รับค่าเพื่อมาคำนวนหาค่าส่ง
  double deliveryfee(money) {
    if (money >= 500) {
      return 0;
    } else {
      return 100;
    }
  }

  // ใช้แสดงอีกเท่าไรถึงจะส่งฟรี
  String freeDelivery(money) {
    if (money >= 500) {
      return 'You have FREE DELIVERY';
    } else {
      double missing = 500.0 - money;

      return 'ADD ${missing.toStringAsFixed(2)} For FREE Delivery';
    }
  }

  // ผลรวมค่า ของ+ส่ง
  double total(subtotal, deliveryfee) {
    return subtotal + deliveryfee(subtotal);
  }

  // เปลี่ยน  subtotal  เป็นสตริงไปแสดงบนแอพ
  String get subtotalString => subtotal.toStringAsFixed(2);

  // เปลี่ยน  ค่าส่ง  เป็นสตริงไปแสดงบนแอพ
  String get deliveryFeeString => deliveryfee(subtotal).toStringAsFixed(2);

  // เปลี่ยน  ราคาอีกเท่าไรถึงส่งฟรี/ส่งฟรีแล้ว  เป็นสตริงไปแสดงบนแอพ
  String get freeDeliveryString => freeDelivery(subtotal);

  // เปลี่ยน  ราคารวมทั้งหมด  เป็นสตริงไปแสดงบนแอพ
  String get totalString => total(subtotal, deliveryfee).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];

  //Map สินค้า เพื่อเพิ่มลดรายการสั่ง
  Map productQuantity(products) {
    var quantity = {};

    products.forEach((productKey) {
      if (!quantity.containsKey(productKey)) {
        quantity[productKey] = 1;
      } else {
        quantity[productKey] += 1;
      }
    });

    return quantity;
  }
}
