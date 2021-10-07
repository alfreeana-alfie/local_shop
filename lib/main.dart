import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_shop/auth/forgot_password.dart';
import 'package:local_shop/auth/sign_in.dart';
import 'package:local_shop/auth/sign_up.dart';
import 'package:local_shop/auth/sign_up_seller.dart';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = new HttpOverrides();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: SignUpSellerPage(),
    )
  );
}
