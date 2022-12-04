import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const DrawerItem({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 75,
        width: 310,
        decoration: BoxDecoration(
          color: arabicCoffeeColor.withOpacity(0.8),
          boxShadow: const [
           BoxShadow(
            color: blackCoffeeColor,
            offset: Offset(0, 5),
            spreadRadius: 2,
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                icon,
                size: 40,
                color: blackCoffeeColor,
              ),
            ),
            TitleWidget(text: text, size: 22, textWeight: FontWeight.w500, textColor: coffeeCakeColor, paddingTop: 0, paddingBottom: 0, paddingLeft: 5, aligment: Alignment.centerLeft)
          ],
        ),
      ),
    );
  }
}
