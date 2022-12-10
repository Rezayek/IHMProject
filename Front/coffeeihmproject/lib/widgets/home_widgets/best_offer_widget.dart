import 'package:coffeeihmproject/Services/data_services/data_controller/data_model.dart';
import 'package:coffeeihmproject/widgets/home_widgets/price_widget.dart';
import 'package:coffeeihmproject/widgets/home_widgets/product_image_widget.dart';
import 'package:coffeeihmproject/widgets/home_widgets/rating_hor.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BestOfferWidget extends StatelessWidget {
  final DataModel itemData;
  const BestOfferWidget({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0, right: 10.0, top: 5, bottom:5),
      child: Container(
        height: 160,
        width: 350,
        decoration: BoxDecoration(
          color: orangeCoffeeColor.withOpacity(0.9),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: const [
            BoxShadow(
              color: coffeeCakeColor,
              spreadRadius: 3,
              blurRadius: 2,
            ),
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProductImageWidget(itemImageUrl: itemData.modelImageUrl, height: 150, width: 150,),
            Container(
              height: 150,
              width: 170,
              decoration: BoxDecoration(
                color: coffeeCakeColor.withOpacity(0.7),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(text: itemData.modelName.isNotEmpty?itemData.modelName: "item###" , size: 18, textWeight: FontWeight.w500, textColor: Colors.black, paddingTop: 0, paddingBottom: 0, paddingLeft: 5, aligment: Alignment.centerLeft),
                    PriceWidget(price: itemData.modelPrice, percentage: itemData.modelPercentage, height: 45, width: 170, iconSize: 20, fontSize: 18),
                    RatingHor(rating: itemData.modelRate, height: 40, width: 140, iconSize: 20, fontSize: 18)
                  
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}