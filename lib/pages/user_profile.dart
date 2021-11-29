import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/constant/link.dart';
import 'package:local_shop/constant/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String name = "";
  String email = "";
  String profilePhoto = "";

  Future getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();

    print(prefs.getString(userFullName));

    setState(() {
      name = prefs.getString(userFullName)!;
      email = prefs.getString(userEmail)!;
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: horizontalValue, 
                    right: horizontalValue,
                    top: 50,
                    bottom: 70,
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.network(
                        profilePhoto,
                        width: 120,
                        height: 120,
                      ),
                    ),
                    spacerWidth,
                    spacerWidth,
                    spacerWidth,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          child: Text(name,
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.0,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          email,
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              _buildListItem('edit_profile', 'Edit Profile',
                  () => {Navigator.pushNamed(context, '/my_profile')}),
              _spacerList(),
              _buildListItem('order', 'Order History', () => {}),
              _spacerList(),
              _buildListItem('address', 'Address Book', () => {}),
              _spacerList(),
              _buildListItem('notification', 'Notifications', () => {}),
              _spacerList(),
              _buildListItem('settings_02', 'Settings', () => {}),
              _spacerList(),
              _buildListItem('sign_out', 'Sign Out', () => {}),
            ],
          ),
        ),
      ),
    );
  }

  _buildListItem(String iconName, String title, Function() onPressed) {
    return ListTile(
        leading: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: yellowPrimaryColor.withOpacity(0.20),
          ),
          child: SvgPicture.asset(
            'assets/icons/$iconName.svg',
            color: yellowPrimaryColor,
            width: 20,
            height: 20,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.7),
        ),
        onTap: onPressed,
        trailing: Icon(
          Icons.chevron_right_rounded,
          color: textColor,
        ));
  }

  _spacerList() {
    return SizedBox(
      height: 10,
    );
  }
}
