import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Services/navigator/navigator_bloc.dart';
import '../user_views/app_views/main_navigation_view.dart';


class InnerController extends StatefulWidget {
  const InnerController({Key? key}) : super(key: key);

  @override
  State<InnerController> createState() => _InnerControllerState();
}

class _InnerControllerState extends State<InnerController> {
  @override
  Widget build(BuildContext context) {
    context.read<NavigatorNavBloc>().add(const EventGoToMain(0));
    return BlocBuilder<NavigatorNavBloc, NavigatorNavState>(
        builder: (context, state) {
      if (state is StateGoToMain) {
        MainNavigationView.currentViewIndex = state.index;
        return const MainNavigationView();
      } else {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
