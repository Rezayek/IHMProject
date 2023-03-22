import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';

import '../home_widgets/label.dart';

class ProductDescription extends StatelessWidget {
  final String description;
  const ProductDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(title: "Description", gradiantColors: [orangeCoffeeColor, orangeCoffeeColor.withOpacity(0)], margin:const [10,10,10,], expanded: 0),
          TitleWidget(
              text: description,
              size: 18,
              textWeight: FontWeight.w400,
              textColor: blackCoffeeColor,
              paddingTop: 0,
              paddingBottom: 0,
              paddingLeft: MediaQuery.of(context).size.width * 0.01,
              aligment: Alignment.topLeft),
        ],
      ),
    );
  }
}
