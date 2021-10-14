import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/model/product.dart';
import 'package:local_shop/pages/product_display.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Widget extra;
  const ProductItem({
    Key? key,
    required this.product,
    required this.extra,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(
      height: 10,
    );
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                offset: const Offset(0, 2)),
          ]),
      child: Material(
        color: Colors.white,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          '${product.photo1}',
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.pName,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'RM${product.price}',
                              style: GoogleFonts.roboto(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: lightBlueColor,
                              ),
                            ),
                            spacer,
                            Text(
                              product.state,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: textColor.withOpacity(0.30)),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: RatingBar.builder(
                                    ignoreGestures: true,
                                    unratedColor: Colors.grey.shade300,
                                    itemSize: 17,
                                    initialRating: double.parse(product.rating),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    '(${product.sold})',
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      color: textColor.withOpacity(0.40),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
                  extra
                ],
              ),
            ),
          ),
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => ProductEgDisplayPage(
            //           product: product,
            //         )));
          },
        ),
      ),
    );
  }
}
