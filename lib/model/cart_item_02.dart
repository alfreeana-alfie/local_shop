import 'package:local_shop/model/product.dart';

class Cart {
  String cartUid,
      sessionId,
      active,
      total,
      pName,
      content,
      discountId,
      price,
      sellerId,
      imagePath;

  Cart(
      {required this.cartUid,
      required this.sessionId,
      required this.active,
      required this.total,
      required this.pName,
      required this.content,
      required this.discountId,
      required this.price,
      required this.sellerId,
      required this.imagePath});

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
        cartUid: map['uid'] as String,
        sessionId: map['sessionId'] as String,
        active: map['active'] as String,
        total: map['total'] as String,
        pName: map['p_name'] as String,
        content: map['content'] as String,
        discountId: map['discount_id'] as String,
        price: map['price'] as String,
        sellerId: map['seller_id'] as String,
        imagePath: map['path01'] as String);
  }
}
