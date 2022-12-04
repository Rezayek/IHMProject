part of 'navigator_bloc.dart';

abstract class NavigatorNavEvent {
  const NavigatorNavEvent();
}

class EventGoToMain extends NavigatorNavEvent {
  final int index;
  const EventGoToMain(this.index);
}

class EventGoToCategorie extends NavigatorNavEvent {
  final Categories categorie;
  const EventGoToCategorie(this.categorie);
}
