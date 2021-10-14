import 'package:local_shop/model/product.dart';

class CartItem {
  final Product product;
  final int count;

  CartItem({
    required this.product,
    required this.count,
  });
}
