part of 'navigator_bloc.dart';

abstract class NavigatorNavState {
  const NavigatorNavState();
}

class NavigatorInitial extends NavigatorNavState {}

class StateGoToMain extends NavigatorNavState {
  final int index;
  const StateGoToMain(this.index);
}

class StateGoToCategorie extends NavigatorNavState {
  final Categories categorie;
  const StateGoToCategorie(this.categorie);
}
