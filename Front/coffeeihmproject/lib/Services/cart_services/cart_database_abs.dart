import 'cart_product_model.dart';

abstract class CartDataBaseAbs {
  Future<void> createCartItem({
    required String userId,
    required String itemId,
    required String itemName,
    required String itemCost,
    required int itemQte,
    required String itemImg,
  });
  Future<void> deleteCartItem({required String itemId});
  Future<int> deleteAllItems();
  Stream<List<CartProductModel>> cart();
  Stream<double> cost();
  Future<CartProductModel> getItem({required String itemId});
  Future<void> updateItem(
      {required String itemId, required String itemCost, required int itemQTE});
}
