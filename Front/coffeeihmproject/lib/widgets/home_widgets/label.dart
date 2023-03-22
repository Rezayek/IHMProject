import 'package:coffeeihmproject/constants/colors.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String title;
  final List<Color> gradiantColors;
  final List<double> margin;
  final double expanded;
  const Label(
      {Key? key,
      required this.title,
      required this.gradiantColors,
      required this.margin, required this.expanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int titleWidth = title.length * 15;
    return Container(
      margin: EdgeInsets.only(top: margin[0], bottom: margin[1], left: margin[2]),
      height: MediaQuery.of(context).size.height * 0.1,
      width: titleWidth + MediaQuery.of(context).size.width * 0.1 + expanded,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: titleWidth + MediaQuery.of(context).size.width *0.015 + expanded,
            decoration: const BoxDecoration(color: blackCoffeeColor),
          )),
          Positioned(
            bottom: MediaQuery.of(context).size.height *0.03,
            right: MediaQuery.of(context).size.height *0.03,
            child: Container(
              height: MediaQuery.of(context).size.height *0.07,
              width: titleWidth + MediaQuery.of(context).size.width *0.05 + expanded,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: gradiantColors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      color: coffeeCakeColor, fontWeight: FontWeight.w600, fontSize: 25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}