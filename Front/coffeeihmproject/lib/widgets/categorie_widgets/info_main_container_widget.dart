import 'package:coffeeihmproject/widgets/categorie_widgets/info_container_widget.dart';
import 'package:coffeeihmproject/widgets/home_widgets/price_widget.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';

import '../../Services/data_services/data_controller/data_model.dart';
import 'line_widget.dart';

class InfoMainContainer extends StatelessWidget {
  final DataModel item;
  const InfoMainContainer({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        height: 155,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleWidget(text: item.modelName.isNotEmpty? item.modelName: "itemm???", size: 18, textWeight: FontWeight.w500, textColor: Colors.black, paddingTop: 5, paddingBottom: 2, paddingLeft: 5, aligment: Alignment.centerLeft),
            const LineWidget(isLeft: false, isTop: true, height:3,),
            PriceWidget(price: item.modelPrice, percentage: item.modelPercentage, height: 40, width: MediaQuery.of(context).size.width * 0.35, iconSize: 22, fontSize: 22),
            const LineWidget(isLeft: false, isTop: true, height: 3,),
            InfoContainerWidget(rank: item.modelRank, rate: item.modelRate, isAvailable: item.modelIsAvailable),
          ],
        ),
      ),
    );
  }
}
