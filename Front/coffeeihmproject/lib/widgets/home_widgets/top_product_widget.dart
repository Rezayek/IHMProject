import 'package:coffeeihmproject/widgets/home_widgets/product_image_widget.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';

import '../../Services/data_services/data_controller/data_model.dart';
import '../../constants/colors.dart';

class TopProductWidget extends StatelessWidget {
  final DataModel itemData;
  const TopProductWidget({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 230,
        width: 180,
        decoration: const BoxDecoration(
          color: coffeeColor,
          borderRadius:  BorderRadius.all(Radius.circular(30)),
          boxShadow: [
             BoxShadow(
              color: coffeeCakeColor,
              spreadRadius: 3,
              blurRadius: 1,
            )
          ]
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  child: ProductImageWidget(itemImageUrl: itemData.modelImageUrl, height: 180, width: 160,),
                ),
                Positioned(
                  left: 110,
                  top: 5,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(60)
                    ),
                    child: TitleWidget(text: itemData.modelRank.isNotEmpty? itemData.modelRank: "?", size: 20, textWeight: FontWeight.w600, textColor: orangeCoffeeColor, paddingTop: 0, paddingBottom: 0, paddingLeft: 10, aligment: Alignment.centerLeft),
                  ),
                  ),
              ],
            ),
            TitleWidget(text:itemData.modelName.isNotEmpty? itemData.modelName: "#####" , size: 20, textWeight: FontWeight.w400, textColor: coffeeCakeColor, paddingTop: 10, paddingBottom: 0, paddingLeft: 5, aligment: Alignment.topCenter)
          ],
        ) ,
    
      ),
    );
  }
}