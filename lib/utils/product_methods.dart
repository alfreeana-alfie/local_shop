import 'package:http/http.dart' as http;
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/constant/link.dart';
import 'package:local_shop/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:local_shop/model/cart_item_02.dart';

Future addToCart(BuildContext context, String userId, String total,
    String productId, String quantity) async {
  final response = await http.post(
    addToCartUrl,
    headers: headers,
    body: {
      "user_id": userId,
      "product_id": productId,
      "quantity": quantity,
      "active": "false",
      "total": total,
    },
  );

  if (response.statusCode == 201) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(addToCartTextSuccess)));
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(addToCartTextFailed)));
  }
}
