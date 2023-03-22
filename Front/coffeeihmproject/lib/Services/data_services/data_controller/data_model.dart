import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class DataModel {
  final String modelId;
  final String modelName;
  final String modelImageUrl;
  final String modelPrice;
  final String modelPercentage;
  final String modelRank;
  final String modelRate;
  final String modelCategorie;
  final String modelDescription;
  final bool modelIsAvailable;

  const DataModel({
    required this.modelId,
    required this.modelName,
    required this.modelImageUrl,
    required this.modelPrice,
    required this.modelPercentage,
    required this.modelRank,
    required this.modelRate,
    required this.modelDescription,
    required this.modelIsAvailable,
    required this.modelCategorie,
  });

  factory DataModel.fromAPI(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) => DataModel(
        modelId:snapshot.id,
        modelName: snapshot.data()['productName'],
        modelDescription: snapshot.data()['productDescription'],
        modelImageUrl: snapshot.data()['productImageUrl'],
        modelPrice: snapshot.data()['productPrice'],
        modelPercentage: snapshot.data()['productPercentage'],
        modelRank: snapshot.data()['productRank'],
        modelRate: snapshot.data()['productRate'],
        modelIsAvailable: snapshot.data()['productIsAvailable'],
        modelCategorie: snapshot.data()['productCategorie'],
      );
}
