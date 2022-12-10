import 'package:coffeeihmproject/widgets/categorie_widgets/item_state_widget.dart';
import 'package:coffeeihmproject/widgets/categorie_widgets/rank_widget.dart';
import 'package:coffeeihmproject/widgets/categorie_widgets/rate_widget.dart';
import 'package:flutter/material.dart';

import 'line_widget.dart';

class InfoContainerWidget extends StatelessWidget {
  final String rank, rate;
  final bool isAvailable;
  const InfoContainerWidget({Key? key, required this.rank, required this.rate, required this.isAvailable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.37,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RankWidget(rank: rank),
          const LineWidget(isLeft: true, isTop: false, height: 55,),
          RateWidget(rate: rate),
          const LineWidget(isLeft: true, isTop: false, height: 55,),
          ItemStateWidget(isAvailable: isAvailable)
        ],
      ),
    );
  }
}
