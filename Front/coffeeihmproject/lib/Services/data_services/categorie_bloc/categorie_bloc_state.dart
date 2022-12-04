part of 'categorie_bloc_bloc.dart';

@immutable
abstract class CategorieBlocState {
  const CategorieBlocState();
}

class CategorieBlocInitial extends CategorieBlocState {}

class StateGetCategorieItems extends CategorieBlocState {
  final Exception? exception;
  final Iterable<DataModel> categorie;

  const StateGetCategorieItems(this.categorie, this.exception);
}
