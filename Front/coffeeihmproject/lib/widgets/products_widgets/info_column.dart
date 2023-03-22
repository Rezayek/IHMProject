import 'package:coffeeihmproject/Services/data_services/data_controller/data_model.dart';
import 'package:coffeeihmproject/widgets/products_widgets/info_square.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoColumn extends StatelessWidget {
  final double height;
  final double width;
  final DataModel product;
  const InfoColumn({super.key, required this.height, required this.width, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InfoSquare(info: product.modelRank, icon: FontAwesomeIcons.rankingStar, testToIcon: false,),
          InfoSquare(info: product.modelRate, icon: FontAwesomeIcons.star, testToIcon: false,),
          InfoSquare(info: '', icon: product.modelIsAvailable ? FontAwesomeIcons.check : FontAwesomeIcons.x, testToIcon: true,),
          InfoSquare(info: "${product.modelPercentage}%", icon: FontAwesomeIcons.arrowDown, testToIcon: false,),
        ],
      ),
    );
  }
}
