import 'package:coffeeihmproject/Services/cart_services/cost_bloc/cost_bloc.dart';
import 'package:coffeeihmproject/user_views/app_views/other_views/drawer_views/chat_widgets/chat_bot_view.dart';
import 'package:coffeeihmproject/user_views/app_views/other_views/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Services/auth/api_controller/api_porvider.dart';
import '../Services/auth/api_controller/auth_services.dart';
import '../Services/auth/bloc/auth_bloc.dart';
import '../Services/cart_services/cart_bloc.dart/cart_bloc.dart';
import '../Services/data_services/best_offer_bloc/data_bloc.dart';
import '../Services/data_services/categorie_bloc/categorie_bloc_bloc.dart';
import '../Services/data_services/data_controller/api_data_services.dart';
import '../Services/data_services/top_item_bloc/top_items_bloc_bloc.dart';
import '../Services/navigator/navigator_bloc.dart';
import '../Services/product_services/review_bloc/review_bloc.dart';
import '../Services/product_services/reviews_services.dart';
import '../appContollers/outer_controller.dart';
import '../user_views/app_views/other_views/categorie_view.dart';

class AppRouter {
  final AuthBloc authBloc = AuthBloc(AuthServices(APIProvider()));
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider.value(
            value: authBloc,
            child: MultiBlocProvider(
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
                BlocProvider<CartBloc>(
                  create: ((context) => CartBloc()),
                ),
                BlocProvider<CostBloc>(
                  create: ((context) => CostBloc()),
                ),
              ],
              child: const OuterController(),
            ),
          ),
        );

      case "/categorie":
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => BlocProvider.value(
                value: authBloc, child: const CategorieView()));
      case "/product":
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => BlocProvider.value(
                value: authBloc,
                child: BlocProvider<ReviewsBlocBloc>(
                  create: ((context) => ReviewsBlocBloc(ReviewsService())),
                  child: const ProductView(),
                )));

      case "/chatbot":
      return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => BlocProvider.value(
                value: authBloc,
                child: BlocProvider<ReviewsBlocBloc>(
                  create: ((context) => ReviewsBlocBloc(ReviewsService())),
                  child: const ChatBotView(),
                )));
    }
    return null;
  }

  void dispose() {
    authBloc.close();
  }
}
