import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/constant/link.dart';
import 'package:local_shop/constant/string.dart';
import 'package:local_shop/model/category.dart';
import 'package:local_shop/model/division.dart';
import 'package:local_shop/model/product.dart';
import 'package:local_shop/model/verify.dart';
import 'package:local_shop/widgets/product_control_item.dart';
import 'package:local_shop/widgets/product_grid_item.dart';
import 'package:local_shop/widgets/sorting_bar.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:filter_list/filter_list.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late Map<String, dynamic> verifyMap;
  late Map<String, dynamic> divisionMap;
  late Map<String, dynamic> productMap;
  List<String> divisionList = [];
  List<Product> prodList = [];

  String searchProduct = '';
  bool isViewList = false;
  bool isSortedList = false;
  bool isFiltered = false;

  List<String>? selectedDivisionList = [];

  List<Product> filteredProductList = [];

  Future showDivisionList() async {
    final response = await http.get(
      getStateListUrl,
      headers: headers,
    );

    if (response.statusCode == 200) {
      verifyMap = jsonDecode(response.body);

      var verifyData = Verify.fromJSON(verifyMap);

      if (verifyData.status == successText) {
        divisionMap = jsonDecode(response.body);
        for (var divisionData in divisionMap['data']) {
          final division = Division.fromMap(divisionData);

          setState(() {
            divisionList.add(division.sName);
          });
        }
      }
    }
  }

  Future showProductList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? categoryName = prefs.getString('categoryName');

    print(categoryName);

    final response = await http.get(
      Uri.parse('${showProductByCategoryUrl}/${categoryName}'),
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
    // get data
    showProductList(); // Show Product List based on Category
    showDivisionList(); // Show Division List
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        bottom: PreferredSize(
            child: FilterOptions(
              onPressedFilterList: () {},
              onPressedSorting: () {
                setState(() {
                  isSortedList = !isSortedList;
                  if (isSortedList == true) {
                    prodList.sort((a, b) => a.price.compareTo(b.price));
                  } else {
                    prodList.sort((a, b) => b.price.compareTo(a.price));
                  }
                });
              },
              onPressedViewList: () {
                setState(() {
                  isViewList = !isViewList;
                });
              },
              isSortedList: isSortedList,
              isViewList: isViewList,
            ),
            preferredSize: Size.fromHeight(70)),
        elevation: 5.0,
        iconTheme: IconThemeData(
          color: textColor,
        ),
        title: TextBox(),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [primaryColor, primaryColor]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: defaultMargin,
                child: isViewList ? _buildGridList() : _buildListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildGridList() {
    return GridView.builder(
      clipBehavior: Clip.none,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2 / 3),
      itemCount: prodList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ProductGridItem(product: prodList[index]),
        );
      },
    );
  }

  _buildListView() {
    return Column(
      children: [
        for (Product product in prodList) ProductControlItem(product: product)
      ],
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      color: Colors.white,
      child: TextField(
        decoration:
            InputDecoration(border: InputBorder.none, hintText: 'Search'),
      ),
    );
  }
}
