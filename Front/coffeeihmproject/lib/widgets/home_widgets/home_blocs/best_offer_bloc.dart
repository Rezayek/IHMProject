import 'package:flutter/material.dart';
import 'dart:developer' as debug;
import '../../../Services/data_services/data_controller/data_model.dart';
import '../best_offer_widget.dart';

class BestOfferBloc extends StatelessWidget {
  final Iterable<DataModel> bestOffers;
  const BestOfferBloc({Key? key, required this.bestOffers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bestOffers.length,
        itemBuilder: ((context, index) {
          return InkWell(
              onTap: () {
                debug.log("Best offer $index: ${bestOffers.elementAt(index)}");
              },
              child:
                  BestOfferWidget(itemData: bestOffers.elementAt(index)));
        }));
  }
}
