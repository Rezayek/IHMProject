part of 'categorie_bloc_bloc.dart';

@immutable
abstract class CategorieBlocEvent {
  const CategorieBlocEvent();
}

class EventGetCategorieItems extends CategorieBlocEvent {
  final Categories categorie;

  const EventGetCategorieItems(this.categorie);

}
