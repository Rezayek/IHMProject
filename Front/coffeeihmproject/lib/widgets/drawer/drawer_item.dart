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
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
          color: arabicCoffeeColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
           BoxShadow(
            color: coffeeCakeColor,
            offset: Offset(1, 1),
            blurRadius: 2,
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
                size: 30,
                color: blackCoffeeColor,
              ),
            ),
            TitleWidget(text: text, size: 20, textWeight: FontWeight.w400, textColor: coffeeCakeColor, paddingTop: 0, paddingBottom: 0, paddingLeft: 5, aligment: Alignment.centerLeft)
          ],
        ),
      ),
    );
  }
}
