import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ProductTopInfos extends StatelessWidget {
  final String productName;
  final String productCost;
  const ProductTopInfos({super.key, required this.productName, required this.productCost});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleWidget(
              text: productName,
              size: 22,
              textWeight: FontWeight.w400,
              textColor: blackCoffeeColor,
              paddingTop: 0,
              paddingBottom: 0,
              paddingLeft: 0,
              aligment: Alignment.centerLeft),
          TitleWidget(
              text: "Price: $productCost\$",
              size: 16,
              textWeight: FontWeight.w400,
              textColor: blackCoffeeColor,
              paddingTop: 0,
              paddingBottom: 0,
              paddingLeft: 10,
              aligment: Alignment.centerLeft),
        ],
      ),
    );
  }
}
