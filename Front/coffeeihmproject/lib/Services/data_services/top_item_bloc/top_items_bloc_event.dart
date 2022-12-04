part of 'top_items_bloc_bloc.dart';

@immutable
abstract class TopItemsBlocEvent {
  const TopItemsBlocEvent();
}

class DataEventHomeDataTopItems extends TopItemsBlocEvent {
  const DataEventHomeDataTopItems();
}
