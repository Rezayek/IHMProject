import 'package:coffeeihmproject/Services/data_services/categorie_bloc/categorie_bloc_bloc.dart';
import 'package:coffeeihmproject/widgets/categorie_widgets/categorie_widget_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorieItemsController extends StatelessWidget {
  const CategorieItemsController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorieBlocBloc, CategorieBlocState>(
        builder: (context, state) {
      if (state is StateGetCategorieItems) {
        return CategorieWidgetBloc(categorieItems: state.categorie);
      }else{
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
