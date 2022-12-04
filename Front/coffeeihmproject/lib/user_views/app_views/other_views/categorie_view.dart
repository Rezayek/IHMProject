// ignore_for_file: no_logic_in_create_state

import 'package:coffeeihmproject/Services/data_services/categorie_bloc/categorie_bloc_bloc.dart';
import 'package:coffeeihmproject/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Services/navigator/navigator_bloc.dart';
import '../../../appContollers/categorie_items_controller.dart';
import '../../../constants/colors.dart';
import '../../../widgets/categorie_widgets/categorie_widget_bloc.dart';
import '../../../widgets/drawer/drawer_view.dart';
import '../../../widgets/home_widgets/categories_container_widget.dart';
import '../../../widgets/title_widget.dart';
import 'dart:developer' as debug;

class CategorieView extends StatefulWidget {
  final Categories categorie;
  const CategorieView({Key? key, required this.categorie}) : super(key: key);

  @override
  State<CategorieView> createState() => _CategorieViewState(categorie);
}

class _CategorieViewState extends State<CategorieView> {
  final Categories categorie;
  _CategorieViewState(this.categorie);

  @override
  void initState() {
    context.read<CategorieBlocBloc>().add(EventGetCategorieItems(categorie));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: arabicCoffeeColor.withOpacity(0.8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.category,
              color: coffeeCakeColor,
              size: 35,
            ),
            TitleWidget(
                text: categorie.name,
                size: 30,
                textWeight: FontWeight.w600,
                textColor: coffeeCakeColor,
                paddingTop: 0,
                paddingBottom: 0,
                paddingLeft: 10,
                aligment: Alignment.centerLeft),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children:  [
          const Positioned(child: BackgroundWidget()),
          Positioned(
            child:Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SizedBox(
              height: 1000,
              width: MediaQuery.of(context).size.width,
              child: const CategorieItemsController(),
                      ),
            ) )
        ],
      ),
      drawer: const DrwerView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: orangeCoffeeColor.withOpacity(0.8),
        onPressed: () {
          context.read<NavigatorNavBloc>().add(const EventGoToMain(0));
        },
        child: const Icon(Icons.home, size: 30, color: blackCoffeeColor),
      ),
    );
  }
}
