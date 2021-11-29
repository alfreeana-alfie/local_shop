import 'package:local_shop/model/cart_item_02.dart';
import 'package:local_shop/model/product.dart';

class CartItem {
  final Product product;
  final Cart cart;

  CartItem({
    required this.product,
    required this.cart,
  });
}
