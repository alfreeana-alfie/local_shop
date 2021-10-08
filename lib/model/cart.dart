import 'package:local_shop/model/product_eg.dart';

class CartItem {
  final ProductEg product;
  final int count;

  CartItem({
    required this.product,
    required this.count,
  });
}
