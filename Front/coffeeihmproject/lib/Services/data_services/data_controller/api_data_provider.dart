import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeihmproject/Services/data_services/data_controller/data_model.dart';
import 'package:coffeeihmproject/Services/data_services/data_controller/data_provider.dart';

import 'package:coffeeihmproject/holders/current_user.dart';

import '../../../widgets/home_widgets/categories_container_widget.dart';
import 'dart:developer' as debug;

import 'DataExceptions.dart';

class APIDataProvider implements DataProvider {
  CurrentUser user = CurrentUser();
  final products = FirebaseFirestore.instance.collection('Products');
  @override
  Future<Iterable<DataModel>> getBestOffer() async {
    try {
      return  await products.doc("Beans").collection("BeansProducts").get().then((value) =>
          value.docs.map((doc) => DataModel.fromAPI(doc)));
    } catch (e) {
      throw FailedToFetchDataException();
    }
  }

  @override
  Future<Iterable<DataModel>> getCategorieItems(
      {required Categories categorie}) async {
    switch (categorie) {
      case Categories.beans:
        try {
          return await products.doc("Beans").collection("BeansProducts").get().then((value) =>
          value.docs.map((doc) => DataModel.fromAPI(doc)));
        } catch (e) {
          throw FailedToFetchDataException();
        }
      case Categories.machines:
        try {
          return await products.doc("Beans").collection("GiftssProducts").get().then((value) =>
            value.docs.map((doc) => DataModel.fromAPI(doc)));
        } catch (e) {
          throw FailedToFetchDataException();
        }
      case Categories.products:
        try {
          return await products.doc("Beans").collection("MachinesProducts").get().then((value) =>
            value.docs.map((doc) => DataModel.fromAPI(doc)));
        } catch (e) {
          throw FailedToFetchDataException();
        }
      case Categories.gifts:
        try {
          return await products.doc("Beans").collection("ProductsProducts").get().then((value) =>
            value.docs.map((doc) => DataModel.fromAPI(doc)));
            
        } catch (e) {
          throw FailedToFetchDataException();
        }
    }

  }

  @override
  Future<List<DataModel>> getItem({required String itemId}) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<List<DataModel>> getTopItems() async {
    try {
          Iterable<DataModel> list = await products.doc("Beans").collection("BeansProducts").get().then((value) =>
          value.docs.map((doc) => DataModel.fromAPI(doc)));
          return list.toList();
        } catch (e) {
          throw FailedToFetchDataException();
        }

   
  }
}
