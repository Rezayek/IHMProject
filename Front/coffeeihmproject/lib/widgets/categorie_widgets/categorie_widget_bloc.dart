import 'package:flutter/material.dart';

import '../../Services/data_services/data_controller/data_model.dart';
import 'categorie_item_wideget.dart';

class CategorieWidgetBloc extends StatelessWidget {
  final Iterable<DataModel> categorieItems;
  const CategorieWidgetBloc({Key? key, required this.categorieItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: categorieItems.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
                onTap: () {
                },
                child: CategorieItemWidget(item: categorieItems.elementAt(index))),
          );
        }));
  }
}
