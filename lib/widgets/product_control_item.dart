import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/model/product.dart';
import 'package:local_shop/widgets/circle_button.dart';
import 'package:local_shop/widgets/product_item.dart';

class ProductControlItem extends StatelessWidget {
  final Product product;
  const ProductControlItem({Key? key, required this.product}) : super(key: key);

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
    return ProductItem(
      product: product,
      extra: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LikeButton(
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
        ],
      ),
    );
  }
}
