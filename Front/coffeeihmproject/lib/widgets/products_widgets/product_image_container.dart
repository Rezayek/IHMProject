import 'package:coffeeihmproject/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductImageContainer extends StatelessWidget {
  final double height;
  final double width;
  final String uri;
  const ProductImageContainer({super.key, required this.height, required this.width, required this.uri});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(35)),
        color: irishCoffeeColor,
        boxShadow: const [BoxShadow(color: blackCoffeeColor, offset: Offset(-1, 1), blurRadius: 2)],
        image: uri.isEmpty? const DecorationImage(image: AssetImage("assets/default.jpg"), fit: BoxFit.fill): DecorationImage(image: NetworkImage(uri), fit: BoxFit.fill)
      ),
    );
  }
}