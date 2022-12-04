import 'package:bloc/bloc.dart';
import 'package:coffeeihmproject/widgets/home_widgets/categories_container_widget.dart';
import 'package:meta/meta.dart';

import '../data_controller/api_data_services.dart';
import '../data_controller/data_model.dart';

part 'categorie_bloc_event.dart';
part 'categorie_bloc_state.dart';

class CategorieBlocBloc extends Bloc<CategorieBlocEvent, CategorieBlocState> {
  CategorieBlocBloc(APIDataServices provider) : super(CategorieBlocInitial()) {
    on<CategorieBlocEvent>((event, emit) {
    });

    on<EventGetCategorieItems>((event, emit) async {
      Iterable<DataModel> categorieItems = const Iterable.empty();
      try {
        Iterable<DataModel> categorieItems = await provider.getCategorieItems(categorie: event.categorie);
        emit(StateGetCategorieItems(categorieItems, null));
      } on Exception catch (e) {
        emit(StateGetCategorieItems(categorieItems, e));
      }
    });
  }
}
