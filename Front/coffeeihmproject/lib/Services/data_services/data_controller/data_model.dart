import 'package:flutter/foundation.dart';

@immutable
class DataModel {
  final String modelName;
  final String modelImageUrl;
  final String modelPrice;
  final String modelPercentage;
  final String modelRank;
  final String modelRate;

  final String modelDescription;
  final bool modelIsAvailable;

  const DataModel( 
      {
      required this.modelName,
      required this.modelImageUrl,
      required this.modelPrice,
      required this.modelPercentage,
      required this.modelRank,
      required this.modelRate,
      required this.modelDescription,
      required this.modelIsAvailable,});

  factory DataModel.fromAPI(Map<String, dynamic> snapshot) => DataModel(
      modelName: snapshot['productName'],
      modelDescription: snapshot['productDescription'],
      modelImageUrl: snapshot['productImageUrl'],
      modelPrice: snapshot['productPrice'],
      modelPercentage: snapshot['productPercentage'],
      modelRank: snapshot['productRank'],
      modelRate: snapshot['productRate'],
      modelIsAvailable: snapshot['productIsAvailable'],
      );
}
