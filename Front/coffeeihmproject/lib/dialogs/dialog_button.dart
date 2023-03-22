import 'package:coffeeihmproject/constants/colors.dart';
import 'package:flutter/material.dart';

import 'default_border.dart';

class DialogButton extends StatelessWidget {
  final String buttonText;
  const DialogButton({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width *0.24,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
        DefaultBorder(
            borderRadius: 25,
            height: MediaQuery.of(context).size.height *0.055,
            width: MediaQuery.of(context).size.width *0.23),
        Container(
          height: MediaQuery.of(context).size.height *0.052,
          width: MediaQuery.of(context).size.width *0.21,
          decoration: BoxDecoration(
            color:coffeeCakeColor,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Center(child: Text(buttonText, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        )
      ]),
    );
  }
}