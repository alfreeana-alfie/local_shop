import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/constant/string.dart';
import 'package:local_shop/utils/auth_method.dart';
import 'package:local_shop/widgets/clickable_text.dart';
import 'package:local_shop/widgets/text_field.dart';
import 'package:local_shop/widgets/title.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  EdgeInsetsGeometry marginField = const EdgeInsets.symmetric(
      horizontal: horizontalValue, vertical: verticalValue);
  EdgeInsetsGeometry marginLabel =
      const EdgeInsets.symmetric(horizontal: horizontalValue);

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [greenSecondColor, greenFirstColor]),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [secondContainer()],
        ),
      ),
    );
  }

  Widget secondContainer() {
    return Container(
      margin: const EdgeInsets.only(top: homeSecondContainer),
      color: primaryColor,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // EMAIL **START**
            CustomTitle(
              title: signInText.toUpperCase(),
              textStyle: GoogleFonts.roboto(
                  fontSize: 32, color: textColor, fontWeight: FontWeight.w800),
              alignment: Alignment.topCenter,
              margin: marginField,
            ),
            CustomTitle(
              title: emailText,
              textStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  color: greenFirstColor,
                  fontWeight: FontWeight.w500),
              alignment: Alignment.centerLeft,
              margin: marginLabel,
            ),
            CustomTextField(
              onSaved: (value) => email = value!,
              hintText: emailHintText,
            ),
            // EMAIL **END**

            // PASSWORD **START**
            CustomTitle(
              title: passwordText,
              textStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  color: greenFirstColor,
                  fontWeight: FontWeight.w500),
              alignment: Alignment.centerLeft,
              margin: marginLabel,
            ),
            CustomTextField(
              onSaved: (value) => password = value!,
              hintText: passwordHintText,
            ),
            // PASSWORD **END**
            ClickableText(
                alignment: Alignment.centerLeft,
                text: forgotPassword,
                selectedTextColor: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                tapGestureRecognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Forgot Password');
                  },
                margin: const EdgeInsets.symmetric(horizontal: horizontalValue, vertical: 5)),
            gradButton()
          ],
        ),
      ),
    );
  }

  Widget gradButton() {
    return Container(
      margin: marginField,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [greenSecondColor, greenFirstColor]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          print(email);
          print(password);
          // if (_formKey.currentState.validate()) {
          //   login();
          // } else {
          //   ScaffoldMessenger.of(context)
          //       .showSnackBar(SnackBar(content: Text("Error!")));
          // }
        },
        child: const Text('LOGIN',
            style: TextStyle(fontSize: 18, fontFamily: 'Open Sans')),
      ),
    );
  }
}
