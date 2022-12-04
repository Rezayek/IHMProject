import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleWidget extends StatelessWidget {
  Color textColor;
  String text;
  FontWeight textWeight;
  double size, paddingTop, paddingBottom, paddingLeft;
  AlignmentGeometry aligment;

  TitleWidget(
      {Key? key,
      required this.text,
      required this.size,
      required this.textWeight,
      required this.textColor,
      required this.paddingTop,
      required this.paddingBottom,
      required this.paddingLeft,
      required this.aligment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:aligment,
      child: Padding(
        padding: EdgeInsets.only(
            top: paddingTop, bottom: paddingBottom, left: paddingLeft),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: textWeight,
            fontSize: size,
          ),
        ),
      ),
    );
  }
}
