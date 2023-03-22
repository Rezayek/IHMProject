import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ResponsiveButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color color;
  final bool isDelete;
  const ResponsiveButtonWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.color, required this.isDelete});

  @override
  Widget build(BuildContext context) {
    return !isDelete ?Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: orangeCoffeeColor.withOpacity(0.5),
            )
          ]),
      child: TitleWidget(
          text: text,
          size: 18,
          textWeight: FontWeight.w400,
          textColor: blackCoffeeColor,
          paddingTop: 0,
          paddingBottom: 0,
          paddingLeft: 0,
          aligment: Alignment.center),
    ): const Icon(Icons.delete, color: Colors.red, size: 45,);
  }
}
