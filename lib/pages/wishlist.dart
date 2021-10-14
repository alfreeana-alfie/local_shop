import 'package:flutter/material.dart';
import 'package:local_shop/model/cart.dart';
import 'package:local_shop/model/product_eg.dart';
import 'package:local_shop/widgets/app_button.dart';
import 'package:local_shop/widgets/base_view.dart';
import 'package:local_shop/widgets/cart_product_item.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({ Key? key }) : super(key: key);

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  
  @override
  Widget build(BuildContext context) {
    List<CartItem> wishList = [
      // CartItem(
      //   product: ProductEg(
      //     name: 'Pineapple',
      //     imageUrl: 'pineapple',
      //     price: 50,
      //     quantity: '4 in 1 pack',
      //     description: 'Pineapple',
      //   ),
      //   count: 1,
      // ),
      // CartItem(
      //   product: ProductEg(
      //     name: 'Deshi Cabbage',
      //     imageUrl: 'cabbage',
      //     price: 90,
      //     quantity: '1kg',
      //     description: 'Pineapple',
      //   ),
      //   count: 4,
      // ),
    ];
    return BaseView(
        title: 'Your Wishlist',
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  for (CartItem wish in wishList)
                    CartProductItem(cartItem: wish)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: AppButton(title: 'Add to Cart'),
              ),
            )
          ],
        ));
  }
}