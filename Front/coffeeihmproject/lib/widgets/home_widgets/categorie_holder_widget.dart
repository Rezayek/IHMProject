import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Services/navigator/navigator_bloc.dart';
import '../../constants/colors.dart';
import 'categories_container_widget.dart' show Categories;

class CategorieHolder extends StatelessWidget {
  final Categories categorie;
  const CategorieHolder({Key? key, required this.categorie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NavigatorNavBloc>().add(EventGoToCategorie(categorie));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 215,
          width: MediaQuery.of(context).size.width * 0.38,
          decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [
              coffeeCakeColor,
              arabicCoffeeColor.withOpacity(0.4),
              coffeeCakeColor, 
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(35)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  // ignore: prefer_interpolation_to_compose_strings
                  image: DecorationImage(image: AssetImage('assets/'+categorie.name+'.jpg'), fit: BoxFit.fill),
                  boxShadow: const [BoxShadow(
                    color: blackCoffeeColor,
                    spreadRadius: 2,
                    blurRadius: 1,
                  )]
                ),
              ),
              TitleWidget(text: categorie.name.toUpperCase(), size: 17, textWeight: FontWeight.w600, textColor: brownCoffeeColor, paddingTop: 10, paddingBottom: 0, paddingLeft: 10, aligment: Alignment.topCenter)
            ],
          ),
        ),
      ),
    );
  }
}
