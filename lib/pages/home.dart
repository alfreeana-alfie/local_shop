import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/constant/link.dart';
import 'package:local_shop/constant/string.dart';
import 'package:local_shop/model/category.dart';
import 'package:local_shop/model/product.dart';
import 'package:local_shop/model/product_eg.dart';
import 'package:local_shop/model/verify.dart';
import 'package:local_shop/widgets/category_item.dart';
import 'package:local_shop/widgets/product_control_item.dart';
import 'package:http/http.dart' as http;
import 'package:local_shop/widgets/product_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map<String, dynamic> verifyMap;
  late Map<String, dynamic> cateMap;
  late Map<String, dynamic> productMap;
  List<Category> cateList = [];
  List<Product> prodList = [];

  Future getCategoryList() async {
    final response = await http.get(
      getCategoryListUrl,
      headers: headers,
    );

    if (response.statusCode == 200) {
      verifyMap = jsonDecode(response.body);

      var verifyData = Verify.fromJSON(verifyMap);

      if (verifyData.status == successText) {
        cateMap = jsonDecode(response.body);
        for (var cateData in cateMap['data']) {
          final categories = Category.fromMap(cateData);

          setState(() {
            cateList.add(categories);
          });
        }
      }
    }
  }

  Future showAllProductList() async {
    final response = await http.get(
      showAllUrl,
      headers: headers,
    );

    if (response.statusCode == 200) {
      verifyMap = jsonDecode(response.body);

      var verifyData = Verify.fromJSON(verifyMap);

      if (verifyData.status == successText) {
        productMap = jsonDecode(response.body);
        for (var prodData in productMap['data']) {
          final products = Product.fromMap(prodData);

          setState(() {
            prodList.add(products);
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCategoryList();
    showAllProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: defaultMargin,
                child: _buildSearchBar(),
              ),
              spacer,
              _buildAdvertisement(),
              spacer,
              Container(
                padding: defaultMargin,
                child: _buildCategories(),
              ),
              spacer,
              Padding(
                padding: defaultMargin,
                child: _buildNewArrivals(),
              ),
              spacer,
              Padding(
                padding: defaultMargin,
                child: _buildDailyNeeds(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildAdvertisement() {
    final PageController controller = PageController(initialPage: 0);
    return Container(
      // width: 50,
      height: 250,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/banner1.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/banner2.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/banner3.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cateList
            .map((category) => CategoryItem(
                  category: category,
                ))
            .toList(),
      ),
    );
  }

  _buildSearchBar() {
    return Row(
      children: [
        Image.asset('assets/icons/delivery.png'),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 2)),
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 4),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search ProductEg',
                  hintStyle: TextStyle(
                    color: const Color(0xff434040).withOpacity(0.30),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: const Color(0xff707070).withOpacity(0.30),
                  )),
            ),
          ),
        )),
      ],
    );
  }

  _buildNewArrivals() {
    List<ProductEg> productegs = [
      ProductEg(
        name: 'Deshi Mango',
        imageUrl: 'mango',
        price: 300,
        quantity: '1Kg',
        shade: Shade.orange,
      ),
      ProductEg(
        name: 'Brocolli',
        imageUrl: 'broccoli',
        price: 450,
        quantity: '5 in pack',
        inCart: true,
      ),
    ];
    return _buildProductEgWrapper(
      title: newArrivals,
      color: const Color(0xfffc5455),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: prodList
              .map((category) => ProductGridItem(
                    product: category,
                  ))
              .toList(),
        ),
      ),
    );
  }

  _buildDailyNeeds() {
    return _buildProductEgWrapper(
        title: dailyNeeds,
        color: lightBlueColor,
        child: Column(
          children: [
            for (Product product in prodList)
              ProductControlItem(product: product)
          ],
        ));
  }

  _buildProductEgWrapper(
      {required String title, required Color color, required Widget child}) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: color,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Text(
                title,
                style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
          InkWell(
            child: Text(
              viewAllText,
              style: TextStyle(
                color: color,
              ),
            ),
            onTap: () {},
          )
        ]),
        const SizedBox(
          height: 10,
        ),
        child,
      ],
    );
  }
}
