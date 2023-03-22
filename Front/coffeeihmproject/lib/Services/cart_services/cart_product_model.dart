import 'cart_db_constants.dart';

class CartProductModel {
  final String userId;
  final String itemId;
  final String itemName;
  final String itemCost;
  final String itemImg;
  final int itemStock;

  CartProductModel({
    required this.userId,
    required this.itemId,
    required this.itemName,
    required this.itemCost,
    required this.itemImg,
    required this.itemStock,
  });

  CartProductModel.fromRow(Map<String, Object?> map)
      : userId = map[userIdColumn] as String,
        itemId = map[itemIdColumn] as String,
        itemName = map[itemNameColumn] as String,
        itemCost = map[itemCostColumn] as String,
        itemStock = map[itemQteColumn] as int,
        itemImg = map[itemImgColumn] as String;
}
