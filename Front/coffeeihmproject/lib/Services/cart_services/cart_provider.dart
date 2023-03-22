import 'package:coffeeihmproject/Services/cart_services/cart_product_model.dart';

import 'cart_database.dart';
import 'cart_database_abs.dart';

class CartProvider implements CartDataBaseAbs {
  final cartDb = CartDatabase();

  static final CartProvider _shared = CartProvider._sharedInstance();

  CartProvider._sharedInstance();

  factory CartProvider() => _shared;
  @override
  Stream<List<CartProductModel>> cart() => cartDb.cart();

  @override
  Future<void> createCartItem(
          {required String userId,
          required String itemId,
          required String itemName,
          required String itemCost,
          required int itemQte,
          required String itemImg}) =>
      cartDb.createCartItem(
          userId: userId,
          itemId: itemId,
          itemName: itemName,
          itemCost: itemCost,
          itemQte: itemQte,
          itemImg: itemImg);

  @override
  Future<int> deleteAllItems() => cartDb.deleteAllItems();

  @override
  Future<void> deleteCartItem({required String itemId}) =>
      cartDb.deleteCartItem(itemId: itemId);

  @override
  Future<CartProductModel> getItem({required String itemId}) =>
      cartDb.getItem(itemId: itemId);

  @override
  Future<void> updateItem(
          {required String itemId,
          required String itemCost,
          required int itemQTE}) =>
      cartDb.updateItem(itemId: itemId, itemCost: itemCost, itemQTE: itemQTE);

  @override
  Stream<double> cost() => cartDb.cost();
}
