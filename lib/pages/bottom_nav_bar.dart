import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/string.dart';
import 'package:local_shop/pages/cart.dart';
import 'package:local_shop/pages/home.dart';
import 'package:local_shop/pages/user_profile.dart';
import 'package:local_shop/pages/wishlist.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late PageController _pageController;

  double fontSize = 14;
  FontWeight fontWeight = FontWeight.w700;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: primaryColor),
      child: Scaffold(
        body: _buildPageContent(),
        bottomNavigationBar: BottomNavyBar(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          selectedIndex: _currentIndex,
          showElevation: false,
          containerHeight: 60,
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          }),
          items: [
            BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: _createBarIcon('home', 0),
              title: Text(
                homeText,
                style: GoogleFonts.roboto(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
              activeColor: lightBlueColor,
            ),
            BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: _createBarIcon('cart', 1),
              title: Text(
                cartText,
                style: GoogleFonts.roboto(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
              activeColor: lightBlueColor,
            ),
            BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: _createBarIcon('wish_list', 2),
              title: Text(
                wishListText,
                style: GoogleFonts.roboto(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
              activeColor: lightBlueColor,
            ),
            BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: _createBarIcon('user_profile', 3),
              title: Text(
                userProfileText,
                style: GoogleFonts.roboto(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
              activeColor: lightBlueColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent() {
    return SizedBox.expand(
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: const [
          HomePage(),
          CartPage(),
          WishListPage(),
          UserProfilePage()
        ],
      ),
    );
  }

  Widget _createBarIcon(String name, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: SvgPicture.asset(
        'assets/icons/$name.svg',
        width: 20,
        height: 20,
        color: _currentIndex == index ? bluePrimaryColor : redPrimaryColor,
      ),
    );
  }
}
