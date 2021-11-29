import 'package:flutter/material.dart';
import 'package:local_shop/model/cart_item.dart';
import 'package:local_shop/model/cart_item_02.dart';
import 'package:local_shop/widgets/circle_button.dart';
import 'package:local_shop/widgets/product_item.dart';

class CartProductItem extends StatelessWidget {
  final Cart cartItem;
  const CartProductItem({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductItem(
        product: cartItem.product,
        extra: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleButton(),
            Text('${cartItem.count}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            const CircleButton(
              isAdd: false,
            ),
          ],
        ));
  }
}
