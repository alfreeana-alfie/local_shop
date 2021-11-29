import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:local_shop/auth/sign_in.dart';
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/constant/link.dart';
import 'package:http/http.dart' as http;
import 'package:local_shop/constant/string.dart';
import 'package:local_shop/model/user.dart';
import 'package:local_shop/model/verify.dart';
import 'package:local_shop/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void signIn(String email, String password, BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();

  Map<String, dynamic> verifyMap;
  Map<String, dynamic> userMap;

  final response = await http.post(loginUrl,
      headers: headers, body: {"email": email, "password": password});

  if (response.statusCode == 200) {
    verifyMap = jsonDecode(response.body);

    var verifyData = Verify.fromJSON(verifyMap);

    if (verifyData.status == "SUCCESS") {
      userMap = jsonDecode(response.body);

      var userData = User.fromJSON(userMap);

      prefs.setString(userId, userData.id);
      prefs.setString(userFullName, userData.name);
      prefs.setString(userName, userData.username);
      prefs.setString(userEmail, userData.email);
      prefs.setString(userImage, userData.image);
      prefs.setBool(isLoggedIn, true);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(signInPageSuccess)));

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(incorrectEmailOrPassword)));
    }
  }
}

void signUp(BuildContext context, String name, String username, String email,
    String password) async {
  final response = await http.post(
    registerUrl,
    headers: headers,
    body: {
      "name": name,
      "username": username,
      "email": email,
      "password": password,
      "image": defaultUserImage
    },
  );

  if (response.statusCode == 201) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(signUpPageSuccess)));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(signUpPageFailed)));
  }
}

void forgotPassword(BuildContext context, String email) async {
  final response = await http.post(
    forgotPasswordUrl,
    headers: headers,
    body: {"email": email},
  );
  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(emailSent)));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(emailSentError)));
  }
}

void registerAsSeller(BuildContext context, String userId, String icPassport,
    String paymentId, String addrId) async {
  final response = await http.post(
    registerSellerUrl,
    headers: headers,
    body: {
      "user_id": userId,
      "ic_passport": icPassport,
      "payment_id": paymentId,
      "addr_id": addrId
    },
  );
  if (response.statusCode == 201 || response.statusCode == 200) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(emailSent)));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(emailSentError)));
  }
}