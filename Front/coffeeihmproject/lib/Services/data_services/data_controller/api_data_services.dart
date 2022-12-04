import 'package:coffeeihmproject/Services/data_services/data_controller/data_model.dart';
import 'package:coffeeihmproject/Services/data_services/data_controller/data_provider.dart';
import 'package:coffeeihmproject/widgets/home_widgets/categories_container_widget.dart';

import 'api_data_provider.dart';

class APIDataServices implements DataProvider {
  final APIDataProvider provider;
  static final _shared = APIDataServices._sharedInstance(APIDataProvider());
  APIDataServices._sharedInstance(this.provider);
  factory APIDataServices() => _shared;
  

  @override
  Future<Iterable<DataModel>> getBestOffer() async => await provider.getBestOffer();

  @override
  Future<List<DataModel>> getCategorieItems({required Categories categorie}) =>
      provider.getCategorieItems(categorie: categorie);

  @override
  Future<List<DataModel>> getItem({required String itemId}) =>
      provider.getItem(itemId: itemId);

  @override
  Future<List<DataModel>> getTopItems() => provider.getTopItems();
}
