import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart_provider.dart';
import 'cost_event.dart';
import 'cost_state.dart';

class CostBloc extends Bloc<CostEvent, CostState> {
  CartProvider cartDb = CartProvider();
  CostBloc() : super(TotalCostStateInit()) {
    on<TotalCostEvent>(
      (event, emit) {
        emit(TotalCostState(totalCost: cartDb.cost()));
      },
    );
  }
}
