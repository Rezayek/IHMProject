import 'package:coffeeihmproject/constants/colors.dart';
import 'package:flutter/material.dart';


class RatingButton extends StatefulWidget {
  final double height;
  final double width;
  final Function(String rating) onChange;
  const RatingButton(
      {super.key,
      required this.height,
      required this.width,
      required this.onChange});

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  String currentValue = "1";
  var rates = ["1", "2", "3", "4", "5"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: EdgeInsets.all(widget.height * 0.05),
      decoration: BoxDecoration(
          color: coffeeCakeColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                blurRadius: 1,
                offset: const Offset(1, 1),
                color: blackCoffeeColor.withOpacity(0.5))
          ]),
      child: DropdownButton(
        value: currentValue,
        menuMaxHeight: widget.height * 3,
        underline: const SizedBox(),
        icon: Icon(
          Icons.arrow_drop_down,
          size: widget.width * 0.25,
          color: blackCoffeeColor,
        ),
        isExpanded: true,
        items: rates.map((e) {
          return DropdownMenuItem(
              value: e,
              child: Text("$e Star(s)",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: blackCoffeeColor)));
        }).toList(),
        onChanged: (value) {
          setState(() {
            currentValue = value!;
            widget.onChange(value);
          });
        },
      ),
    );
  }
}
