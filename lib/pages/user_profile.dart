import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/widgets/base_view.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({ Key? key }) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: 'You',
        body: ListView(children: [
          _buildListItem('list', 'My Orders', () => {}),
          _buildListItem('wish_list', 'My Favorite', () => {}),
          _buildListItem('wallet', 'Payment Details', () => {}),
          _buildListItem('settings', 'My Account', () => {}),
        ]));
  }

  _buildListItem(String iconName, String title, Function() onPressed) {
    return ListTile(
      leading: SvgPicture.asset(
        'assets/icons/$iconName.svg',
        color: greenFirstColor,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: onPressed,
    );
  }
}