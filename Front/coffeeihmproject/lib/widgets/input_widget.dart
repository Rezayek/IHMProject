


import 'package:flutter/material.dart';

import '../constants/colors.dart';

// ignore: must_be_immutable
class InputWidget extends StatelessWidget {
  TextEditingController controller;
  Color textColor;
  FontWeight fontWeight;
  double fontSize, paddingTop, paddingBottom, paddingLeft;
  TextInputType textType;
  bool isObscure;
  String hintText;
  InputWidget({Key? key, required this.controller, required this.textColor, required this.fontWeight, required this.fontSize, required this.textType, required this.isObscure, required this.hintText, required this.paddingTop, required this.paddingBottom, required this.paddingLeft, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom, left: paddingLeft),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.67,
          decoration: BoxDecoration(
            color:orangeCoffeeColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
               BoxShadow(
                color: coffeeCakeColor,
                spreadRadius: 5,
                blurRadius: 5,
              ), 
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top:7.0, left: 7,),
              child: TextField(
                controller: controller,
                style: TextStyle(
                  color: textColor, 
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                ),
                autocorrect: false,
                obscureText: isObscure,
                keyboardType: textType,
                enableSuggestions: false,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color:blackCoffeeColor,
                    fontWeight: FontWeight.w600
                  )
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
