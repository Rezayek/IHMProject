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


