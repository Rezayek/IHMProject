import 'package:coffeeihmproject/Services/data_services/categorie_bloc/categorie_bloc_bloc.dart';
import 'package:coffeeihmproject/widgets/categorie_widgets/categorie_widget_bloc.dart';
import 'package:coffeeihmproject/widgets/home_widgets/categories_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorieItemsController extends StatefulWidget {
  final Categories categorie;
  const CategorieItemsController({Key? key, required this.categorie}) : super(key: key);

  @override
  State<CategorieItemsController> createState() => _CategorieItemsControllerState();
}

class _CategorieItemsControllerState extends State<CategorieItemsController> {


@override
  void initState() {
    context.read<CategorieBlocBloc>().add(EventGetCategorieItems(widget.categorie));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<CategorieBlocBloc, CategorieBlocState>(
        builder: (context, state) {
      if (state is StateGetCategorieItems) {
        return CategorieWidgetBloc(categorieItems: state.categorie);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
