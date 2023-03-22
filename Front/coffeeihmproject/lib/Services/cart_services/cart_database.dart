import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

import 'cart_database_abs.dart';
import 'cart_db_constants.dart';
import 'cart_exception.dart';
import 'cart_product_model.dart';
import 'dart:developer' as debug;

class CartDatabase implements CartDataBaseAbs {
  Database? _db;

  List<CartProductModel> _cartItems = [];
  double _cost = 0.0;
  late final StreamController<List<CartProductModel>> _cartStreamController;
  late final StreamController<double> _costStreamController;
  static final CartDatabase _shared = CartDatabase._sharedInstance();

  CartDatabase._sharedInstance() {
    _cartStreamController =
        StreamController<List<CartProductModel>>.broadcast(onListen: () {
      _cartStreamController.sink.add(_cartItems);
    });

    _costStreamController = StreamController<double>.broadcast(onListen: () {
      _costStreamController.sink.add(_cost);
    });
  }

  factory CartDatabase() => _shared;

  @override
  Stream<double> cost() {
    _cacheCost();
    return _costStreamController.stream;
  }

  void _cacheCost() {
    final allNotes = totale();
    _costStreamController.add(allNotes);
  }

  @override
  Stream<List<CartProductModel>> cart() {
    _cacheItems();
    return _cartStreamController.stream;
  }

  Future<void> _cacheItems() async {
    final allNotes = await getAllItems();
    _cartItems = allNotes.toList();
    _cartStreamController.add(_cartItems);
    _costStreamController.add(totale());
  }

  @override
  Future<void> updateItem(
      {required String itemId,
      required String itemCost,
      required int itemQTE}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();

    final updateCount = await db.update(
        cartTable, {itemCostColumn: itemCost, itemQteColumn: itemQTE},
        where: 'itemId = ?', whereArgs: [itemId]);
    if (updateCount == 0) {
      throw CouldNotUpdateCartException();
    } else {
      final updatedItem = await getItem(itemId: itemId);
      final index = _cartItems.indexWhere((element) => element.itemId == itemId);
      _cartItems[index] = updatedItem;
      _cartStreamController.add(_cartItems);
      _costStreamController.add(totale());
    }
  }

  @override
  Future<CartProductModel> getItem({required String itemId}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db
        .query(cartTable, limit: 1, where: 'itemId = ?', whereArgs: [itemId]);
    if (results.isEmpty) {
      throw CouldNotFoundItemException();
    } else {
      final item = CartProductModel.fromRow(results.first);
      return item;
    }
  }

  Future<Iterable<CartProductModel>> getAllItems() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final items = await db.query(cartTable);
    return items.map((item) => CartProductModel.fromRow(item));
  }

  @override
  Future<int> deleteAllItems() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final numbreOfDeletions = await db.delete(cartTable);
    _cartItems = [];
    _cartStreamController.add(_cartItems);
    _costStreamController.add(totale());
    return numbreOfDeletions;
  }

  @override
  Future<void> deleteCartItem({required String itemId}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deletedCount =
        await db.delete(cartTable, where: 'itemId = ?', whereArgs: [itemId]);

    if (deletedCount == 0) {
      throw CouldNotDeleteItemException();
    } else {
      _cartItems.removeWhere((element) => element.itemId == itemId);
      _cartStreamController.add(_cartItems);
      _costStreamController.add(totale());
    }
  }

  @override
  Future<void> createCartItem({
    required String userId,
    required String itemId,
    required String itemName,
    required String itemCost,
    required int itemQte,
    required String itemImg,
  }) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();

    try {
      await db.insert(cartTable, {
        userIdColumn: userId,
        itemIdColumn: itemId,
        itemNameColumn: itemName,
        itemCostColumn: itemCost,
        itemQteColumn: itemQte,
        itemImgColumn: itemImg,
      });
    } catch (e) {
      throw ItemAleardyAdded();
    }
  }

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpenException();
    } else {
      return db;
    }
  }

  Future<void> close() async {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpenException();
    } else {
      await db.close();
      _db = null;
    }
  }

  Future<void> _ensureDbIsOpen() async {
    try {
      await open();
    } on DatabaseAlreadyOpenException {}
  }

  Future<void> open() async {
    if (_db != null) {
      throw DatabaseAlreadyOpenException();
    }
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);
      _db = db;

      await db.execute(createCartTable);
      await _cacheItems();
    } catch (e) {
      throw UnableToCreatCartException();
    }
  }

  double totale() {
    if (_cartItems.isEmpty) return 0.0;
    double cost = 0.0;
    for (CartProductModel item in _cartItems) {
      cost = cost + int.parse(item.itemCost) * item.itemStock;
    }
    return cost;
  }
}
