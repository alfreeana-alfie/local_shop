import 'package:flutter/material.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/model/category.dart';
import 'package:local_shop/model/product_eg.dart';
import 'package:local_shop/widgets/category_item.dart';
import 'package:local_shop/widgets/product_control_item.dart';
import 'package:local_shop/widgets/product_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            Padding(
              padding: defaultMargin,
              child: _buildCategories(),
            ),
            spacer,
             Padding(
              padding: defaultMargin,
              child:_buildNewArrivals(),
            ),
            spacer,
            Padding(
              padding: defaultMargin,
              child:_buildDailyNeeds(),
            ),
          ],
        ),
      ),
    );
  }

  _buildAdvertisement() {
    final PageController controller = PageController(initialPage: 0);
    return SizedBox(
      // width: 50,
      height: 250,
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: [
          Image.asset('assets/images/banner1.jpg', fit: BoxFit.fill,),
          Image.asset('assets/images/banner2.jpg', fit: BoxFit.fill,),
          Image.asset('assets/images/banner3.jpg', fit: BoxFit.fill,),
        ],
      ),
    );
  }

  _buildCategories() {
    List<Category> categories = [
      Category(
          name: 'vegetables',
          imageUrl: 'broccoli',
          color: const Color(0xff88c057).withOpacity(0.20)),
      Category(
          name: 'Fruits',
          imageUrl: 'fruit',
          color: const Color(0xffFCD770).withOpacity(0.20)),
      Category(
          name: 'Masala',
          imageUrl: 'mortar',
          color: const Color(0xff713708).withOpacity(0.10)),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
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
                    blurRadius: 30,
                    offset: const Offset(0, 5)),
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
        title: 'NEW ARRIVALS',
        color: const Color(0xfffc5455),
        child: GridView.builder(
          clipBehavior: Clip.none,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 25.0,
              childAspectRatio: 3 / 4),
          itemCount: productegs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ProductEgGridItem(product: productegs[index]),
            );
          },
        ));
  }

  _buildDailyNeeds() {
    List<ProductEg> products = [
      ProductEg(
        name: 'Cabbage',
        imageUrl: 'cabbage',
        price: 300,
        quantity: '1Kg',
      ),
      ProductEg(
        name: 'Red/yellow capsicum',
        imageUrl: 'capscium',
        price: 450,
        quantity: '5 in pack',
        inCart: true,
      ),
    ];
    return _buildProductEgWrapper(
        title: 'DAILY NEEDS',
        color: const Color(0xff03506C),
        child: Column(
          children: [
            for (ProductEg product in products)
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
              color: color,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              )),
          InkWell(
            child: Text(
              'SEE ALL',
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
