import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../Services/data_services/top_item_bloc/top_items_bloc_bloc.dart';
import '../widgets/home_widgets/home_blocs/top_items_bloc.dart';

class TopItemsController extends StatelessWidget {
  const TopItemsController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopItemsBlocBloc, TopItemsBlocState>(builder: (context, state) {
      if (state is DataStateGetDataHomeTopItems) {
        return  SizedBox(
          height: 200,
          width: 300,
          child: TopItemsBloc(topItems: state.topItems,));
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