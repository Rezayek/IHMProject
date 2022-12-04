

import 'package:coffeeihmproject/widgets/home_widgets/categories_container_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigator_event.dart';
part 'navigator_state.dart';

class NavigatorNavBloc extends Bloc<NavigatorNavEvent, NavigatorNavState> {
  NavigatorNavBloc() : super(NavigatorInitial()) {
    on<NavigatorNavEvent>((event, emit) {});

    on<EventGoToMain>((event, emit) {
      emit(StateGoToMain(event.index));
    });

    on<EventGoToCategorie>((event, emit) {
      emit(StateGoToCategorie(event.categorie));
    });
  }
}
