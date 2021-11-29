import 'package:flutter/material.dart';
import 'package:local_shop/constant/link.dart';
import 'package:local_shop/constant/string.dart';
import 'package:local_shop/widgets/text_field.dart';
import 'package:local_shop/widgets/text_field_initial.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String email = "";
  String name = "";
  String username = "";
  String profilePhoto = "";

  Future getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();

    print(prefs.getString(userFullName));

    setState(() {
      name = prefs.getString(userFullName)!;
      email = prefs.getString(userEmail)!;
      username = prefs.getString(userName)!;
      profilePhoto = prefs.getString(userImage)!;
    });
  }

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(profilePhoto, width: 100, height: 100),
              CustomInitialTextField(
                initialValue: name,
                hintText: nameHintText,
                onSaved: (value) => name = value!,
              ),
              CustomInitialTextField(
                initialValue: userName,
                hintText: nameHintText,
                onSaved: (value) => userName = value!,
              ),
              CustomInitialTextField(
                initialValue: email,
                hintText: emailHintText,
                onSaved: (value) => email = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
