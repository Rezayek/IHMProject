import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingHor extends StatelessWidget {
  final String rating;
  final double height, width, iconSize, fontSize; 
  const RatingHor({Key? key, required this.rating, required this.height, required this.width, required this.iconSize, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  height,
      width: width,
      decoration: BoxDecoration(
        color: brownCoffeeColor.withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(35))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleWidget(text: "Rating: ", size: fontSize, textWeight: FontWeight.w500, textColor: Colors.black, paddingTop: 0, paddingBottom: 0, paddingLeft: 5, aligment: Alignment.centerLeft),
          TitleWidget(text: rating.isNotEmpty? "$rating ": "? ", size: fontSize, textWeight: FontWeight.w500, textColor: Colors.black, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, aligment: Alignment.centerLeft),
          const Icon(Icons.star, color: Color.fromARGB(255, 254, 195, 0),)
        ],
      ),
    );
  }
}
