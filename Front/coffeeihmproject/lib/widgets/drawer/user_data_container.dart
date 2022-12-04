import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserDataContainer extends StatelessWidget {
  const UserDataContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 310,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(child: Container(height: 200,
          width: 310,
          decoration: const BoxDecoration(image: DecorationImage(
                image:  AssetImage('assets/drawerpic.jpg'), fit: BoxFit.fill),),
          ),
          ),
          Positioned(
            child: Container(
              height: 180,
              width: 260,
              decoration: BoxDecoration(
                color: coffeeCakeColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(FontAwesomeIcons.user, size:60, color: brownCoffeeColor),
                  SizedBox(
                    height: 170,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TitleWidget(text: "UserName", size: 25, textWeight: FontWeight.w700, textColor: coffeeCakeColor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, aligment: Alignment.center),
                        SizedBox(
                          width: 150, 
                          height: 50,
                        child: Row(
                          children: [
                            const Icon(FontAwesomeIcons.rankingStar, color: orangeCoffeeColor, size:25),
                            TitleWidget(text: "Rank?", size: 20, textWeight: FontWeight.w600, textColor: coffeeCakeColor, paddingTop: 0, paddingBottom: 0, paddingLeft: 10, aligment: Alignment.center),
                          ],
                        ),
                        ),
                        SizedBox(
                          width: 150, 
                          height: 50,
                        child: Row(
                          children: [
                            const Icon(FontAwesomeIcons.coins, color: orangeCoffeeColor, size:25),
                            TitleWidget(text: "Tokens?", size: 20, textWeight: FontWeight.w600, textColor: coffeeCakeColor, paddingTop: 0, paddingBottom: 0, paddingLeft: 10, aligment: Alignment.center),
                          ],
                        ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          )
        ],
        ),
    );
  }
}