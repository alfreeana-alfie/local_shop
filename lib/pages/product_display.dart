import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/model/product.dart';
import 'package:local_shop/widgets/app_button.dart';

class ProductEgDisplayPage extends StatelessWidget {
  final Product product;
  const ProductEgDisplayPage({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(
      height: 6,
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(context),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: horizontalValue),
                  transform: Matrix4.translationValues(0, -45, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductEgTopInfo(context, spacer),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: horizontalValue * 4, vertical: 20),
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                          'Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s',
                          style: TextStyle(
                              height: 1.5,
                              color: const Color(0xff1d1d1d).withOpacity(0.50)),
                        ),
                      ),
                      spacer,
                      const Text(
                        'Related Items',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      spacer,
                      _buildRelatedItems()
                    ],
                  ),
                )
              ],
            ),
          )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ElevatedButton(onPressed: (){}, child: Text('Add to Cart'))
          ),
        ],
      ),
    );
  }

  Container _buildProductEgTopInfo(BuildContext context, SizedBox spacer) {
    double imageSize = MediaQuery.of(context).size.width / 2;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: horizontalValue),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 30,
                offset: const Offset(0, 5)),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/wish_list.svg',
                  width: 40,
                  color: const Color(0xFFC0C0C0),
                )),
          ),
          spacer,
          Center(
            child: Image.network(
              '${product.photo1}',
              fit: BoxFit.cover,
              width: imageSize,
              height: imageSize,
            ),
          ),
          Text(
            product.price,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: textColor.withOpacity(0.68)),
          ),
          spacer,
          Text(
            product.pName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          spacer,
          Text(
            product.state,
            style: TextStyle(fontSize: 19, color: textColor.withOpacity(0.30)),
          ),
        ],
      ),
    );
  }

  Stack _buildHeader(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            color: greenFirstColor,
            height: 150,
          ),
        ),
        Positioned(top: -40, left: -60, child: _headerCirlce(false)),
        Positioned(top: -80, right: -35, child: _headerCirlce(true)),
        AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.dark,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: SvgPicture.asset('assets/icons/back_button.svg')),
          title: const Text(
            'Details',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _buildRelatedItems() {
    return Column(
      children: [
        // for (ProductEg product in products) ProductControlItem(product: product)
      ],
    );
  }

  Widget _headerCirlce(bool isBig) {
    double size = isBig ? 210 : 160;
    return Container(
      decoration: BoxDecoration(
          color: greenFirstColor,
          // color: Colors.red.withOpacity(0.5),
          borderRadius: BorderRadius.circular(size)),
      width: size,
      height: size,
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  // const HeaderClipper();

  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 75, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
