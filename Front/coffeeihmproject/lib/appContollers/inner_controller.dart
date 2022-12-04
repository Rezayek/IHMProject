import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:developer' as debug;

import '../Services/navigator/navigator_bloc.dart';
import '../user_views/app_views/main_navigation_view.dart';
import '../user_views/app_views/other_views/categorie_view.dart';

class InnerController extends StatelessWidget {
  const InnerController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NavigatorNavBloc>().add(const EventGoToMain(0));
    return BlocBuilder<NavigatorNavBloc, NavigatorNavState>(
        builder: (context, state) {
      if (state is StateGoToMain) {
        MainNavigationView.currentViewIndex = state.index;
        return const MainNavigationView();
      } else if (state is StateGoToCategorie) {
        return CategorieView(categorie: state.categorie);
      } else {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
