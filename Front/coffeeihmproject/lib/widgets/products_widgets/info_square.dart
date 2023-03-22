import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoSquare extends StatelessWidget {
  final String info;
  final IconData icon;
  final bool testToIcon;
  const InfoSquare({super.key, required this.info, required this.icon, required this.testToIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02, bottom: MediaQuery.of(context).size.height * 0.02,),
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
          color: coffeeCakeColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                blurRadius: 2, offset: Offset(1, 1), color: blackCoffeeColor)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          !testToIcon?TitleWidget(
              text: info,
              size: 20,
              textWeight: FontWeight.w400,
              textColor: blackCoffeeColor,
              paddingTop: 0,
              paddingBottom: 0,
              paddingLeft: 0,
              aligment: Alignment.center): const Icon(
                FontAwesomeIcons.store,
                size: 20,
                color: brownCoffeeColor,
              ),
          Icon(
            icon,
            size: 20,
            color: brownCoffeeColor,
          )
        ],
      ),
    );
  }
}
