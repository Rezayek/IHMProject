import 'package:coffeeihmproject/Services/data_services/data_controller/data_model.dart';
import 'package:coffeeihmproject/widgets/home_widgets/categories_container_widget.dart';

abstract class DataProvider {
  Future<Iterable<DataModel>> getBestOffer();
  Future<List<DataModel>> getTopItems();
  Future<Iterable<DataModel>> getCategorieItems({required Categories categorie});
  Future<List<DataModel>> getItem({required String itemId});
}
