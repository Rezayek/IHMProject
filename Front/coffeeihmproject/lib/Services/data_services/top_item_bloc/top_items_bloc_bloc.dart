import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data_controller/api_data_services.dart';
import '../data_controller/data_model.dart';
import 'dart:developer' as debug;
part 'top_items_bloc_event.dart';
part 'top_items_bloc_state.dart';

class TopItemsBlocBloc extends Bloc<TopItemsBlocEvent, TopItemsBlocState> {
  TopItemsBlocBloc(APIDataServices provider) : super(TopItemsBlocInitial()) {
    on<TopItemsBlocEvent>((event, emit) {
    });

    on<DataEventHomeDataTopItems>((event, emit) async {
      Iterable<DataModel> topItems = const Iterable.empty();
      try {
        Iterable<DataModel> topItems = await provider.getTopItems();
        emit(DataStateGetDataHomeTopItems(null, topItems));
        debug.log("emitted");
      } on Exception catch (e) {
        emit(DataStateGetDataHomeTopItems(e, topItems));
      }
    });
  }
}
