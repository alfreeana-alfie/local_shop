import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/constant/string.dart';
import 'package:local_shop/widgets/clickable_text.dart';
import 'package:local_shop/widgets/gradient_button.dart';
import 'package:local_shop/widgets/text_field.dart';
import 'package:local_shop/widgets/title.dart';

class SignUpSellerPage extends StatefulWidget {
  const SignUpSellerPage({Key? key}) : super(key: key);

  @override
  _SignUpSellerPageState createState() => _SignUpSellerPageState();
}

class _SignUpSellerPageState extends State<SignUpSellerPage> {
  final _formKey = GlobalKey<FormState>();

  String icPassportNo = '';
  String bankName = '';
  String bankAccNo = '';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [secondContainer()],
          ),
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
            CustomTitle(
              title: beSellerToday.toUpperCase(),
              textStyle: GoogleFonts.roboto(
                  fontSize: 24, color: textColor, fontWeight: FontWeight.w800),
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(
                left: horizontalValue,
                right: horizontalValue,
                top: verticalValue,
                bottom: 20,
              ),
            ),
            CustomTitle(
              title: icPassportText,
              textStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  color: greenFirstColor,
                  fontWeight: FontWeight.w500),
              alignment: Alignment.centerLeft,
              margin: marginLabel,
            ),
            CustomTextField(
              onSaved: (value) => icPassportNo = value!,
              hintText: icPassportHintText,
            ),
            CustomTitle(
              title: bankNameText,
              textStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  color: greenFirstColor,
                  fontWeight: FontWeight.w500),
              alignment: Alignment.centerLeft,
              margin: marginLabel,
            ),
            CustomTextField(
              onSaved: (value) => bankName = value!,
              hintText: bankNameHintText,
            ),
            CustomTitle(
              title: bankAccNoText,
              textStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  color: greenFirstColor,
                  fontWeight: FontWeight.w500),
              alignment: Alignment.centerLeft,
              margin: marginLabel,
            ),
            CustomTextField(
              onSaved: (value) => bankAccNo = value!,
              hintText: bankAccNoHintText,
            ),
            GradientButton(
              beginColorAlignment: Alignment.topLeft,
              endColorAlignment: Alignment.bottomRight,
              colorList: const [greenSecondColor, greenFirstColor],
              onPressed: () {
                // print(email);
              },
              child: Text(
                submitText,
                style: GoogleFonts.roboto(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
              margin: defaultMargin,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDivider() {
    return const Expanded(
      child: Divider(
          height: 2,
          thickness: 1,
          indent: 10,
          endIndent: 10,
          color: Colors.black12),
    );
  }
}
