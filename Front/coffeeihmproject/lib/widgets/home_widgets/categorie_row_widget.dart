import 'package:coffeeihmproject/widgets/home_widgets/categorie_holder_widget.dart';
import 'package:coffeeihmproject/widgets/home_widgets/categories_container_widget.dart';
import 'package:flutter/material.dart';

class CategorieRowWidget extends StatelessWidget {
  final List<Categories> categorie;
  const CategorieRowWidget({Key? key, required this.categorie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0, bottom: 5.0),
      child: SizedBox(
        height: 220,
        width: MediaQuery.of(context).size.width * 0.83,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CategorieHolder(categorie: categorie[0]),
            CategorieHolder(categorie: categorie[1]),
          ],
        ),
      ),
    );
  }
}
