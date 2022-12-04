part of 'top_items_bloc_bloc.dart';

@immutable
abstract class TopItemsBlocState {
  const TopItemsBlocState();
}

class TopItemsBlocInitial extends TopItemsBlocState {}

class DataStateGetDataHomeTopItems extends TopItemsBlocState {
  final Exception? exception;
  final Iterable<DataModel> topItems;
  const DataStateGetDataHomeTopItems(this.exception, this.topItems);
}
