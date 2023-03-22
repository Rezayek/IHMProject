// ignore_for_file: no_logic_in_create_state

import 'package:coffeeihmproject/Services/data_services/categorie_bloc/categorie_bloc_bloc.dart';
import 'package:coffeeihmproject/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Services/data_services/data_controller/api_data_services.dart';
import '../../../appContollers/categorie_items_controller.dart';
import '../../../constants/colors.dart';
import '../../../widgets/drawer/drawer_view.dart';
import '../../../widgets/home_widgets/categories_container_widget.dart';
import '../../../widgets/title_widget.dart';

class CategorieView extends StatefulWidget {
  const CategorieView({Key? key}) : super(key: key);

  @override
  State<CategorieView> createState() => _CategorieViewState();
}

class _CategorieViewState extends State<CategorieView> {
  _CategorieViewState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categorie = ModalRoute.of(context)!.settings.arguments as Categories;
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
      body: BlocProvider<CategorieBlocBloc>(
        create: (context) =>  CategorieBlocBloc(APIDataServices()),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(child: BackgroundWidget()),
            Positioned(
                child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SizedBox(
                height: 1000,
                width: MediaQuery.of(context).size.width,
                child: CategorieItemsController(categorie: categorie),
              ),
            ))
          ],
        ),
      ),
      drawer: const DrwerView(),
      
    );
  }
}
