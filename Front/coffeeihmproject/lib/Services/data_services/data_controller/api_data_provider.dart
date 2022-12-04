import 'package:coffeeihmproject/Services/data_services/data_controller/data_model.dart';
import 'package:coffeeihmproject/Services/data_services/data_controller/data_provider.dart';

import '../../../widgets/home_widgets/categories_container_widget.dart';
import 'dart:developer' as debug;

class APIDataProvider implements DataProvider {
  @override
  Future<Iterable<DataModel>> getBestOffer() async {
    List<DataModel> items = await List.generate(
        5,
        (index) => DataModel.fromAPI(const {
              'modelId': "0005",
              'modelName': "from api",
              'modelImageUrl': "",
              'modelPrice': "",
              'modelPercentage': "5",
              'modelRank': "",
              'modelRate': "",
              'modelDescription': "",
              'modelIsAvailable':false,
            }));
    debug.log("getting data");
    return items;
  }

  @override
  Future<List<DataModel>> getCategorieItems({required Categories categorie}) async {
    List<DataModel> items = await List.generate(
        5,
        (index) => DataModel.fromAPI(const {
              'modelId': "0005",
              'modelName': "Categorie",
              'modelImageUrl': "",
              'modelPrice': "",
              'modelPercentage': "5",
              'modelRank': "",
              'modelRate': "",
              'modelDescription': "",
              'modelIsAvailable':false,
            }));
    debug.log("getting data");
    return items;
  }

  @override
  Future<List<DataModel>> getItem({required String itemId}) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<List<DataModel>> getTopItems() async {
    List<DataModel> items = await List.generate(
        5,
        (index) => DataModel.fromAPI(const {
              'modelId': "0005",
              'modelName': "from api top",
              'modelImageUrl': "",
              'modelPrice': "",
              'modelPercentage': "5",
              'modelRank': "",
              'modelRate': "",
              'modelDescription': "",
              'modelIsAvailable':false,
            }));
    debug.log("getting data");
    return items;
  }
}
