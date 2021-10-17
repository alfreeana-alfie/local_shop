import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/constants.dart';
import 'package:local_shop/constant/string.dart';

class FilterOptions extends StatefulWidget {
  const FilterOptions(
      {required this.onPressedSorting,
      required this.onPressedViewList,
      required this.isViewList,
      required this.isSortedList,
      required this.onPressedFilterList});

  final Function() onPressedSorting;
  final Function() onPressedViewList;
  final Function() onPressedFilterList;
  final bool isViewList;
  final bool isSortedList;

  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  // bool isViewList = false;
  // bool isSortedList = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, bottom: 7),
      alignment: Alignment.topRight,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 130,
                padding: const EdgeInsets.only(right: horizontalValue),
                child: ElevatedButton(
                  onPressed: widget.onPressedFilterList,
                  child: Row(
                    children: [
                      Icon(Icons.filter_alt),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(filterText),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    primary: greyColor,
                    alignment: Alignment.center,
                    onPrimary: textColor.withOpacity(0.6),
                    textStyle: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 5),
                child: ElevatedButton(
                  onPressed: widget.onPressedSorting,
                  child: Row(
                    children: [
                      Icon(Icons.sort_by_alpha),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(widget.isSortedList
                            ? priceLowToHighText
                            : priceHighToLowText),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    primary: greyColor,
                    alignment: Alignment.center,
                    onPrimary: textColor.withOpacity(0.6),
                    textStyle: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(widget.isViewList
                    ? Icons.list_rounded
                    : Icons.grid_view_rounded),
                onPressed: widget.onPressedViewList,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
