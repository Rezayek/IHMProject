import 'dart:convert';

import 'package:coffeeihmproject/Services/data_services/best_offer_bloc/data_bloc.dart';
import 'package:coffeeihmproject/Services/data_services/data_controller/data_model.dart';
import 'package:coffeeihmproject/Services/data_services/data_controller/data_provider.dart';
import 'package:coffeeihmproject/constants/host.dart';
import 'package:coffeeihmproject/holders/current_user.dart';

import '../../../widgets/home_widgets/categories_container_widget.dart';
import 'dart:developer' as debug;

import 'package:http/http.dart' as http;

class APIDataProvider implements DataProvider {
  CurrentUser user = CurrentUser();
  @override
  Future<Iterable<DataModel>> getBestOffer() async {
    List<DataModel> listitems = [];
    try {
      final response = await http.get(
        Uri.parse('$url/getBestOffer'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${user.getUser().token}',
          "Connection": "Keep-Alive",
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var i = 0; i < data['data'].length; i++) {
          listitems.add(DataModel(
              modelName: data['data'][i]['productName'],
              modelImageUrl: data['data'][i]['productImageUrl'],
              modelPrice: data['data'][i]['productPrice'].toString(),
              modelPercentage: data['data'][i]['productPercentage'].toString(),
              modelRank: data['data'][i]['productRank'].toString(),
              modelRate: data['data'][i]['productRate'].toString(),
              modelDescription:
                  data['data'][i]['productDescription'].toString(),
              modelIsAvailable:
                  data['data'][i]['productIsAvailable'] == 1 ? true : false));
        }
      } else {
        debug.log('Failed to create');
      }
    } catch (e) {
      debug.log('Failed to create execption');
    }

    if (listitems.isNotEmpty) {
      return listitems;
    } else {
      return List.generate(
          5,
          (index) => DataModel.fromAPI(const {
                'productName': "from api",
                'productImageUrl': "",
                'productPrice': "",
                'productPercentage': "5",
                'productRank': "",
                'productRate': "",
                'productDescription': "",
                'productIsAvailable': false,
              }));
    }
  }

  @override
  Future<Iterable<DataModel>> getCategorieItems(
      {required Categories categorie}) async {
    debug.log(categorie.name);
    List<DataModel> listitems = [];
    try {
      final response = await http.post(
        Uri.parse('$url/getProductbyCategorie'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${user.getUser().token}',
        },
        body: jsonEncode(<String, String>{
          'productCategorie': categorie.name.toUpperCase(),
        }),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debug.log("cate:$data");
        for (var i = 0; i < data['data'].length; i++) {
          listitems.add(DataModel(
              modelName: data['data'][i]['productName'],
              modelImageUrl: data['data'][i]['productImageUrl'],
              modelPrice: data['data'][i]['productPrice'].toString(),
              modelPercentage: data['data'][i]['productPercentage'].toString(),
              modelRank: data['data'][i]['productRank'].toString(),
              modelRate: data['data'][i]['productRate'].toString(),
              modelDescription:
                  data['data'][i]['productDescription'].toString(),
              modelIsAvailable:
                  data['data'][i]['productIsAvailable'] == 1 ? true : false));
        }
      } else {
        debug.log('Failed to create');
      }
    } catch (e) {
      debug.log('Failed to create execption');
    }
    debug.log(listitems.toString());

    if (listitems.isNotEmpty) {
      return listitems;
    } else {
      return List.generate(
          5,
          (index) => DataModel.fromAPI(const {
                'productName': "from api",
                'productImageUrl': "",
                'productPrice': "",
                'productPercentage': "5",
                'productRank': "",
                'productRate': "",
                'productDescription': "",
                'productIsAvailable': false,
              }));
    }
  }

  @override
  Future<List<DataModel>> getItem({required String itemId}) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<List<DataModel>> getTopItems() async {
    List<DataModel> listitems = [];
    try {
      final response = await http.get(
        Uri.parse('$url/topProoducts'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${user.getUser().token}',
          "Connection": "Keep-Alive",
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var i = 0; i < data['data'].length; i++) {
          listitems.add(DataModel(
              modelName: data['data'][i]['productName'],
              modelImageUrl: data['data'][i]['productImageUrl'],
              modelPrice: data['data'][i]['productPrice'].toString(),
              modelPercentage: data['data'][i]['productPercentage'].toString(),
              modelRank: data['data'][i]['productRank'].toString(),
              modelRate: data['data'][i]['productRate'].toString(),
              modelDescription:
                  data['data'][i]['productDescription'].toString(),
              modelIsAvailable:
                  data['data'][i]['productIsAvailable'] == 1 ? true : false));
        }
      } else {
        debug.log('Failed to create');
      }
    } catch (e) {
      debug.log('Failed to create execption');
    }

    if (listitems.isNotEmpty) {
      return listitems;
    } else {
      return List.generate(
          5,
          (index) => DataModel.fromAPI(const {
                'productName': "from api",
                'productImageUrl': "",
                'productPrice': "",
                'productPercentage': "5",
                'productRank': "",
                'productRate': "",
                'productDescription': "",
                'productIsAvailable': false,
              }));
    }
  }
}
