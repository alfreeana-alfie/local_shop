import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/model/product.dart';
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
    // double imageSize = MediaQuery.of(context).size.width / 3.5;
    double imageSize = 135;

    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 30,
                offset: const Offset(0, 5)),
          ]),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(
                          '${product.photo1}',
                          height: imageSize,
                          fit: BoxFit.fill,
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
                          color: bluePrimaryColor,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: RatingBar.builder(
                        unratedColor: Colors.grey.shade300,
                        itemSize: 17,
                        initialRating: 3,
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
                    )
                  ],
                ),
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => ProductEgDisplayPage(
                  //           product: product,
                  //         )));
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
