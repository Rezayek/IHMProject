
import 'package:coffeeihmproject/constants/colors.dart';
import 'package:flutter/material.dart';



class DefaultBorder extends StatelessWidget {
  final double borderRadius, height, width;
  
  const DefaultBorder({Key? key, required this.borderRadius, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [BoxShadow(blurRadius: 0.75, offset: const Offset(1, 1), color: blackCoffeeColor.withOpacity(0.6)), BoxShadow(blurRadius: 0.75, offset: const Offset(-1, -1), color: blackCoffeeColor.withOpacity(0.6))],
          gradient: const LinearGradient(
            colors: [coffeeCakeColor , blackCoffeeColor, arabicCoffeeColor],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
    );
  }
}