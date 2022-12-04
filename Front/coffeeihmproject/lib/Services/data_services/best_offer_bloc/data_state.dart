part of 'data_bloc.dart';

@immutable
abstract class DataState {
  const DataState();
}

class DataStateInitialized extends DataState {
  const DataStateInitialized() : super();
}

class DataStateGetDataHome extends DataState {
  final Exception? exception;
  const DataStateGetDataHome(this.exception)
      : super();
}

class DataStateGetDataHomeBestOffer extends DataState {
  final Exception? exception;
  final Iterable<DataModel> bestOffers;
  const DataStateGetDataHomeBestOffer(this.exception, this.bestOffers);
}


class DataStateGetCategorieData extends DataState {
  final Exception? exception;
  final Future categorieData;
  const DataStateGetCategorieData(this.categorieData,{required this.exception}) : super();
}

class DataStateGetItemData extends DataState {
  final Exception? exception;
  final Future itemData;
  const DataStateGetItemData(this.itemData, {required this.exception}) : super();
}
