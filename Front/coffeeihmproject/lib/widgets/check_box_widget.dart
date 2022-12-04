import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget({Key? key}) : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
          color: orangeCoffeeColor, borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
              color: coffeeCakeColor,
              borderRadius: BorderRadius.circular(40)),
          child: Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              side: MaterialStateBorderSide.resolveWith(
                (states) => const BorderSide(width: 1, color: coffeeCakeColor),
              ),
              ),
        ),
      ),
    );
  }
}
