part of 'data_bloc.dart';

@immutable
abstract class DataEvent {
  const DataEvent();
}


class DataEventHomeData extends DataEvent {
  const DataEventHomeData();
}
class DataEventHomeDataBestOffer extends DataEvent {
  const DataEventHomeDataBestOffer();
}

class DataEventCategorieData extends DataEvent {
  final Categories categorie;
  const DataEventCategorieData(this.categorie);
}

class DataEventItemData extends DataEvent {
  final String itemId;
  const DataEventItemData(this.itemId);
}
