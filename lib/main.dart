import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_shop/auth/sign_in.dart';

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
    MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: SignInPage(),
    )
  );
}
