import 'package:coffeeihmproject/Services/auth/api_controller/auth_services.dart';
import 'package:coffeeihmproject/Services/auth/bloc/auth_bloc.dart';
import 'package:coffeeihmproject/Services/data_services/categorie_bloc/categorie_bloc_bloc.dart';
import 'package:coffeeihmproject/Services/data_services/top_item_bloc/top_items_bloc_bloc.dart';
import 'package:coffeeihmproject/appContollers/inner_controller.dart';
import 'package:coffeeihmproject/appContollers/outer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Services/auth/api_controller/api_porvider.dart';
import 'Services/data_services/best_offer_bloc/data_bloc.dart';

import 'Services/data_services/data_controller/api_data_provider.dart';
import 'Services/data_services/data_controller/api_data_services.dart';
import 'Services/navigator/navigator_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static bool isHome = false;
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CoffeeApp',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: ((context) => AuthBloc(AuthServices(APIProvider()))),
          ),
          BlocProvider<NavigatorNavBloc>(
            create: ((context) => NavigatorNavBloc()),
          ),
          BlocProvider<DataBloc>(
            create: ((context) => DataBloc(APIDataServices())),
          ),
          BlocProvider<TopItemsBlocBloc>(
            create: ((context) => TopItemsBlocBloc(APIDataServices())),
          ),
          BlocProvider<CategorieBlocBloc>(
            create: ((context) => CategorieBlocBloc(APIDataServices())),
          ),
        ],
        child:const OuterController(),
      ),
    );
  }
}
