import 'package:coffeeihmproject/widgets/home_widgets/cart_widgets/cost_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Services/cart_services/cost_bloc/cost_bloc.dart';
import '../Services/cart_services/cost_bloc/cost_event.dart';
import '../Services/cart_services/cost_bloc/cost_state.dart';

class CostController extends StatefulWidget {
  const CostController({super.key});

  @override
  State<CostController> createState() => _CostControllerState();
}

class _CostControllerState extends State<CostController> {
  @override
  void initState() {
    context.read<CostBloc>().add(TotalCostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CostBloc, CostState>(
      builder: (context, state) {
        if (state is TotalCostState) {
          return CostWidget(cost: state.totalCost);
        }
        return Container();
      },
    );
  }
}
