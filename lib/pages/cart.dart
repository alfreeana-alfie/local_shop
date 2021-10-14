import 'package:flutter/material.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/model/cart.dart';
import 'package:local_shop/model/product_eg.dart';
import 'package:local_shop/widgets/app_button.dart';
import 'package:local_shop/widgets/base_view.dart';
import 'package:local_shop/widgets/cart_product_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<CartItem> cart = [
      // CartItem(
      //   product: Product(
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
        title: 'Your Cart',
        useDefaultPadding: false,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalValue,
                ),
                child: ListView(
                  children: [
                    for (CartItem cartItem in cart)
                      CartProductItem(cartItem: cartItem)
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 53,
                left: horizontalValue,
                right: horizontalValue,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 30,
                    offset: const Offset(0, 5),
                  ),
                ],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.elliptical(250, 70),
                ),
              ),
              child: Column(
                children: [
                  _buildDetailItem('Subtotal', 500),
                  _buildDetailItem('Delivery Fee', 1, highlight: true),
                  _buildDetailItem('Total', 501),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    child: SizedBox(
                      width: double.infinity,
                      child: AppButton(
                        child: Row(
                          children: const [
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Continue to Checkout',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              child: VerticalDivider(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '\$500.0',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  _buildDetailItem(String title, double amount, {bool highlight = false}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xff434040),
                fontSize: 12,
              ),
            ),
            Text(
              '\$$amount',
              style: TextStyle(
                color: highlight ? const Color(0xffFC5455) : textColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Divider(
          color: const Color(0xff707070).withOpacity(0.30),
        )
      ],
    );
  }
}

class Product {
}