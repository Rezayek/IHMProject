import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/colors.dart';

class PriceWidget extends StatelessWidget {
  final String price;
  final String percentage;
  final double height, width, iconSize, fontSize; 
  const PriceWidget({Key? key, required this.price, required this.percentage, required this.height, required this.width, required this.iconSize, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TitleWidget(text: price.isNotEmpty?price:"####", size: fontSize, textWeight: FontWeight.w500, textColor: orangeCoffeeColor, paddingTop: 0, paddingBottom: 0, paddingLeft: 5, aligment: Alignment.centerLeft),
          FaIcon(FontAwesomeIcons.dollarSign,size: iconSize, color: const Color.fromARGB(255, 0, 255, 8),),
          percentage.isNotEmpty? FaIcon(FontAwesomeIcons.arrowDown,size: iconSize, color: const Color.fromARGB(255, 0, 0, 0)): const SizedBox(),
          percentage.isNotEmpty? TitleWidget(text: "$percentage%", size: fontSize, textWeight: FontWeight.w500, textColor: const Color.fromARGB(255, 0, 255, 8), paddingTop: 0, paddingBottom: 0, paddingLeft: 0, aligment: Alignment.centerLeft): const SizedBox(),
        ]
      ),

    );
  }
}
