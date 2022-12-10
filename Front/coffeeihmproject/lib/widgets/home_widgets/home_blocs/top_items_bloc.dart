import 'package:flutter/material.dart';

import '../../../Services/data_services/data_controller/data_model.dart';
import 'dart:developer' as debug;

import '../top_product_widget.dart';
class TopItemsBloc extends StatelessWidget {
  final Iterable<DataModel> topItems;
  const TopItemsBloc({Key? key, required this.topItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      width: double.maxFinite,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: topItems.length,
          itemBuilder: ((context, index) {
            return InkWell(
                onTap: () {
                  debug.log("top item $index: ${topItems.elementAt(index)}");
                },
                child: TopProductWidget(itemData: topItems.elementAt(index)));
          })),
    );
  }
}
