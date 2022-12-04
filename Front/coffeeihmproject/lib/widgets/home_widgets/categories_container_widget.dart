import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'categorie_row_widget.dart';


enum Categories { 
   beens,
   machines,
   products,
   gifts,
}
class CategoriesContainerWidget extends StatefulWidget {
  const CategoriesContainerWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesContainerWidget> createState() => _CategoriesContainerWidgetState();
}

class _CategoriesContainerWidgetState extends State<CategoriesContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: coldBrewCoffeeColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleWidget(text: "Categorie", size: 30, textWeight: FontWeight.w600, textColor: coffeeCakeColor, paddingTop: 10, paddingBottom: 10, paddingLeft: 0, aligment: Alignment.topCenter),
          Container(
            height: 500,
            width: MediaQuery.of(context).size.width * 0.87,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              boxShadow: const  [BoxShadow(spreadRadius: -2, color:blackCoffeeColor )]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CategorieRowWidget(categorie: [Categories.beens, Categories.machines],),
                CategorieRowWidget(categorie: [Categories.products, Categories.gifts],),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}