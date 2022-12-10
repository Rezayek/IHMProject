import 'package:bloc/bloc.dart';
import 'package:coffeeihmproject/Services/data_services/data_controller/api_data_provider.dart';

import 'package:coffeeihmproject/Services/data_services/data_controller/api_data_services.dart';
import 'package:coffeeihmproject/widgets/home_widgets/categories_container_widget.dart';
import 'package:meta/meta.dart';

import '../data_controller/data_model.dart';
import 'dart:developer' as debug;
part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc(APIDataServices provider) : super(const DataStateInitialized()) {
    on<DataEventHomeData>((event, emit) {
      emit(const DataStateGetDataHome(null));
    });

    on<DataEventHomeDataBestOffer>((event, emit) async {
      Iterable<DataModel> bestOffers = const Iterable.empty();
      try {
        bestOffers = await provider.getBestOffer();

        
        emit(DataStateGetDataHomeBestOffer(null, bestOffers));
      } on Exception catch (e) {
        emit(DataStateGetDataHomeBestOffer(e, bestOffers));
      }
    });
  }
}
