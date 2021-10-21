import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/constant/link.dart';
import 'package:local_shop/constant/string.dart';
import 'package:local_shop/model/product.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:page_indicator/page_indicator.dart';

class DisplayPage extends StatefulWidget {
  final Product product;
  const DisplayPage({Key? key, required this.product}) : super(key: key);

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  List<String> photoList = [];
  bool _isSelected = false;
  int quantity = 0;
  double total = 0.0;

  Future getPhoto() async {
    photoList.add(widget.product.photo1);

    if (widget.product.photo2.isNotEmpty) {
      photoList.add(widget.product.photo2);
    }
    if (widget.product.photo3.isNotEmpty) {
      photoList.add(widget.product.photo3);
    }
    if (widget.product.photo4.isNotEmpty) {
      photoList.add(widget.product.photo4);
    }
    if (widget.product.photo5.isNotEmpty) {
      photoList.add(widget.product.photo5);
    }
  }

  @override
  void initState() {
    super.initState();
    getPhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildPageView(), _buildProductDetails()],
          ),
        ),
      ),
      bottomNavigationBar: _buildButtons(),
    );
  }

  _buildPageView() {
    final PageController _controller = PageController(initialPage: 0);
    return SizedBox(
      height: 350,
      child: PageIndicatorContainer(
        align: IndicatorAlign.bottom,
        length: photoList.length,
        indicatorSpace: 5.0,
        padding: const EdgeInsets.all(10),
        indicatorColor: bluePrimaryColor,
        indicatorSelectorColor: yellowPrimaryColor,
        shape: IndicatorShape.circle(size: 12),
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          children: [
            for (var item in photoList)
              Image.network(
                item,
                fit: BoxFit.cover,
              )
          ],
        ),
      ),
    );
  }

  _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
          child: Text(
            widget.product.pName,
            style: GoogleFonts.roboto(
              fontSize: 26,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, left: 10.0),
          child: Row(
            children: [
              RatingBar.builder(
                ignoreGestures: true,
                unratedColor: Colors.grey.shade300,
                itemSize: 20,
                initialRating: double.parse(widget.product.rating),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // print(rating);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  '(${widget.product.sold})',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: textColor.withOpacity(0.40),
                  ),
                ),
              ),
            ],
          ),
        ),
        divider,
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: _buildContent(
            'Price: ',
            Text(
              'RM${widget.product.price}',
              style:
                  GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          ),
        ),
        divider,
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: _buildContent(
            'Options: ',
            InputChip(
                padding: const EdgeInsets.all(2.0),
                // avatar: CircleAvatar(
                //   backgroundColor: Colors.pink.shade600,
                //   child: Text('FD'),
                // ),
                label: Text(
                  'Option A',
                  style: TextStyle(
                      color: _isSelected ? Colors.white : Colors.black),
                ),
                selected: _isSelected,
                selectedColor: Colors.blue.shade600,
                onSelected: (bool selected) {
                  setState(() {
                    _isSelected = selected;
                  });
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: _buildContent(
            'Quantity: ',
            CustomNumberPicker(
              initialValue: 1,
              maxValue: 3,
              minValue: 0,
              step: 1,
              onValue: (value) {
                quantity = int.parse(value.toString());

                setState(() {
                  total = quantity * double.parse(widget.product.price);
                });
                // print(value.toString());
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: _buildContent(
            'Total Price (RM): ',
            Text(
              'RM${total.toString()}',
              style:
                  GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          ),
        ),
        divider,
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: _buildSellerShop(),
        ),
        divider,
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: _buildDescription(),
        )
      ],
    );
  }

  _buildContent(String title, Widget content) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        content
        // Text(
        //   'RM${product.price}',
        //   style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w300),
        // ),
      ],
    );
  }

  _buildSellerShop() {
    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  defaultUserImage,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Seller Name',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: textColor.withOpacity(0.60),
                      ),
                    ),
                    spacer,
                    Text(
                      'State',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: textColor.withOpacity(0.40),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(chatNowText),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            widget.product.content,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }

  _buildButtons() {
    return Container(
      height: 80,
      color: primaryColor,
      child: ListTile(
        title: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    addToCartText,
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: yellowPrimaryColor,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    buyNowText,
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: redPrimaryColor,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
