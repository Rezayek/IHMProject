
import 'package:coffeeihmproject/Services/data_services/data_controller/data_model.dart';
import 'package:coffeeihmproject/appContollers/top_items_controller.dart';
import 'package:coffeeihmproject/widgets/background_widget.dart';

import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as debug;
import '../../../Services/data_services/best_offer_bloc/data_bloc.dart';
import '../../../Services/data_services/top_item_bloc/top_items_bloc_bloc.dart';
import '../../../appContollers/best_offer_controller.dart';

import '../../../constants/colors.dart';
import '../../../widgets/home_widgets/categories_container_widget.dart';
import '../../../widgets/home_widgets/label.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  @override
  void initState() {
    context.read<DataBloc>().add(const DataEventHomeDataBestOffer());
    context.read<TopItemsBlocBloc>().add(const DataEventHomeDataTopItems());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            child: BackgroundWidget(),
          ),
          Positioned(
              child: SingleChildScrollView(
            child: SizedBox(
              height: 1300,
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.all(10)),
                  Label(title: "Latest offers", gradiantColors: [orangeCoffeeColor, orangeCoffeeColor.withOpacity(0)], margin:const [10,10,10,], expanded: 0),
                  const SizedBox(
                    height: 190,
                    width: double.maxFinite,
                    child:  BestOfferController()),
                  Label(title: "Top Products", gradiantColors: [orangeCoffeeColor, orangeCoffeeColor.withOpacity(0)], margin:const [10,10,10,], expanded: 0),
                  const SizedBox(
                    height: 270,
                    width: double.maxFinite,
                    child: TopItemsController()),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: CategoriesContainerWidget(),
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
