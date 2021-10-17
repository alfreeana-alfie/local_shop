import 'package:flutter/material.dart';
import 'package:local_shop/auth/forgot_password.dart';
import 'package:local_shop/auth/sign_in.dart';
import 'package:local_shop/auth/sign_up.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/pages/bottom_nav_bar.dart';
import 'package:local_shop/pages/product_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var status = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Brands',
      routes: {
        '/forgot': (context) => const ForgotPasswordPage(),
        '/sign_up': (context) => const SignUpPage(),
        '/product_list': (conte2xt) => const ProductListPage(),
      },
      home: SplashScreenView(
        navigateRoute: status == true ? MainPage() : SignInPage(),
        duration: 7000,
        imageSize: 200,
        imageSrc: 'assets/icons/delivery.png',
        text: "eMarketplace",
        backgroundColor: primaryColor,
        pageRouteTransition: PageRouteTransition.SlideTransition,
      ),
    ),
  );
}