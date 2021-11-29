import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/constant/link.dart';
import 'package:local_shop/constant/string.dart';
import 'package:local_shop/model/cart_item.dart';
import 'package:local_shop/model/cart_item_02.dart';
import 'package:local_shop/model/verify.dart';
import 'package:local_shop/widgets/app_button.dart';
import 'package:local_shop/widgets/base_view.dart';
import 'package:local_shop/widgets/cart_product_item.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Map<String, dynamic> verifyMap;
  late Map<String, dynamic> cartMap;
  List<Cart> cartList = [];
  
  Future getCartList() async {
    final prefs = await SharedPreferences.getInstance();

    String id = prefs.getString(userId)!;

    final response = await http.get(Uri.parse('${showCartListUrl}/${userId}'),
        headers: headers);

    if (response.statusCode == 200) {
      verifyMap = jsonDecode(response.body);

      var verifyData = Verify.fromJSON(verifyMap);

      if (verifyData.status == successText) {
        cartMap = jsonDecode(response.body);
        for (var data in cartMap['data']) {
          final carts = Cart.fromMap(data);

          setState(() {
            cartList.add(carts);
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    getCartList();
  }

  @override
  Widget build(BuildContext context) {
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
                    for (CartItem cartItem in cartList)
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

class Product {}
