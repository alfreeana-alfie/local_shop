import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/model/product.dart';
import 'package:local_shop/pages/product_details_display.dart';
import 'package:local_shop/pages/product_display.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;
  const ProductGridItem({Key? key, required this.product}) : super(key: key);

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    print(!isLiked);
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(
      height: 3,
    );

    double imageHeight = 135;
    double imageWidth = 160;

    return Container(
      margin: EdgeInsets.only(right:12, bottom:7),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                offset: const Offset(0, 2)),
          ]),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:15),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          '${product.photo1}',
                          width: imageWidth,
                          height: imageHeight,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    spacer,
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Text(
                        product.pName,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'RM${product.price}',
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: lightBlueColor,
                        ),
                      ),
                    ),
                    spacer,
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        product.state,
                        style: TextStyle(
                            fontSize: 13, color: textColor.withOpacity(0.30)),
                      ),
                    ),
                    spacer,
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
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
                    )
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DisplayPage(
                            product: product,
                          )));
                },
              ),
            ),
          ),
          Positioned(
            bottom: 7,
            right: 7,
            child: LikeButton(
              size: 25,
              circleColor:
                  CircleColor(start: bluePrimaryColor, end: yellowPrimaryColor),
              bubblesColor: BubblesColor(
                dotPrimaryColor: redPrimaryColor,
                dotSecondaryColor: yellowPrimaryColor,
                dotThirdColor: bluePrimaryColor,
              ),
              likeBuilder: (bool isLiked) {
                return SvgPicture.asset(
                  'assets/icons/filled-love.svg',
                  color: isLiked ? Colors.red : Colors.grey.shade300,
                );
              },
              onTap: onLikeButtonTapped,
            ),
          ),
        ],
      ),
    );
  }
}
