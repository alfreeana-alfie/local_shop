import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_shop/model/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double size = 80;
    const containerRadius = BorderRadius.all(Radius.circular(5));

    String colorString = category.color;
    String valueString = colorString.split('(0x')[1].split(')')[0];
    int value = int.parse(valueString, radix: 16);
    Color otherColor = new Color(value);

    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: otherColor,
        borderRadius: containerRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: containerRadius,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                '${category.icon}',
                width: 30,
                height: 30,
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  category.cName,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('categoryName', category.cName);
            Navigator.pushNamed(context, '/product_list');
          },
        ),
      ),
    );
  }
}
