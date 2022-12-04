import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  Color textColor;
  String text;
  FontWeight textWeight;
  double fontSize,heightCoef, widthCoef, paddingTop, paddingBottom, paddingLeft, paddingLeftContainer;
  AlignmentGeometry aligment;
  

  ButtonWidget({Key? key, 
  required this.heightCoef, 
  required this.widthCoef, 
  required this.text, 
  required this.textColor,
  required this.fontSize,
  required this.textWeight,
  required this.aligment,
  required this.paddingTop,
  required this.paddingBottom,
  required this.paddingLeft,
  required this.paddingLeftContainer }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeftContainer),
      child: Container(
        height: MediaQuery.of(context).size.height * heightCoef,
        width: MediaQuery.of(context).size.width * widthCoef,
        decoration: BoxDecoration(
          color: arabicCoffeeColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color:blackCoffeeColor.withOpacity(0.9),
              offset: const Offset(0,5),
              spreadRadius: 2
               )
          ]
        ),
        child: TitleWidget(text: text, size: fontSize, textWeight: textWeight, textColor: textColor, paddingTop: paddingTop, paddingBottom: paddingBottom, paddingLeft: paddingLeft, aligment: aligment) ,
      ),
    );
  }
}