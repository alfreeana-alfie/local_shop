import 'package:flutter/material.dart';
import 'package:local_shop/constant/app_color.dart';

class CircleButton extends StatelessWidget {
  final bool isGreen;
  final bool isAdd;
  const CircleButton({Key? key, this.isGreen = true, this.isAdd = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isGreen
                ? [
                    greenFirstColor,
                    greenSecondColor,
                  ]
                : [
                    orangeFirstColor,
                    orangeSecondColor,
                  ],
          )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: isGreen ? greenFirstColor : orangeFirstColor,
          borderRadius: BorderRadius.circular(50),
          child: Icon(
            isAdd ? Icons.add : Icons.remove,
            size: 20,
            color: Colors.white,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
