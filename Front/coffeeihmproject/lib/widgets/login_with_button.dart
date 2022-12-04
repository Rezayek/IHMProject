import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class LoginWithButton extends StatelessWidget {
  final double height, width;
  final IconData icon;
  final String text;
  const LoginWithButton({Key? key, required this.height, required this.width, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              arabicCoffeeColor.withOpacity(0.8),
              brownCoffeeColor.withOpacity(0.8), 
              coffeeCakeColor, 
              coffeeCakeColor, 
              coffeeCakeColor,             
              coffeeCakeColor,
              
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(
            color: blackCoffeeColor.withOpacity(0.7),
            blurRadius: 2,
            spreadRadius: 1.5,
          )]
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: coffeeCakeColor, size: 35,),
              TitleWidget(text: text , size: 18, textWeight: FontWeight.w600, textColor: orangeCoffeeColor, paddingTop: 0, paddingBottom: 0, paddingLeft: 15, aligment: Alignment.center)
            ],
          ),
        ),
      ),
    );
  }
}
