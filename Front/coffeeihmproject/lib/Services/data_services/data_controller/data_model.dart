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
  final String modelDescription;
  final bool modelIsAvailable;

  const DataModel(
      {required this.modelId,
      required this.modelName,
      required this.modelImageUrl,
      required this.modelPrice,
      required this.modelPercentage,
      required this.modelRank,
      required this.modelRate,
      required this.modelDescription,
      required this.modelIsAvailable});

  factory DataModel.fromAPI(Map<String, dynamic> snapshot) => DataModel(
      modelId: snapshot['modelId'],
      modelName: snapshot['modelName'],
      modelImageUrl: snapshot['modelImageUrl'],
      modelPrice: snapshot['modelPrice'],
      modelPercentage: snapshot['modelPercentage'],
      modelRank: snapshot['modelRank'],
      modelRate: snapshot['modelRate'],
      modelDescription: snapshot['modelDescription'],
      modelIsAvailable: snapshot['modelIsAvailable']);
}
