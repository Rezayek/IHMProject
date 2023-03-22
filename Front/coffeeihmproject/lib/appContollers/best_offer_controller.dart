import 'package:coffeeihmproject/appContollers/top_items_controller.dart';
import 'package:coffeeihmproject/widgets/home_widgets/home_blocs/best_offer_bloc.dart';
import 'package:coffeeihmproject/widgets/home_widgets/top_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Services/data_services/best_offer_bloc/data_bloc.dart';
import 'dart:developer' as debug;

import '../widgets/home_widgets/home_blocs/top_items_bloc.dart';

class BestOfferController extends StatefulWidget {
  const BestOfferController({Key? key}) : super(key: key);

  @override
  State<BestOfferController> createState() => _BestOfferControllerState();
}

class _BestOfferControllerState extends State<BestOfferController> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(builder: (context, state) {
      if (state is DataStateGetDataHomeBestOffer) {
        return SizedBox(
            height: 200,
            width: 300,
            child: BestOfferBloc(
              bestOffers: state.bestOffers,
            ));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
