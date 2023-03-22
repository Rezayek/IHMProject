abstract class CartEvent {}

 
class CartGetProducts extends CartEvent {

}

class CartDeleteProduct extends CartEvent {
  final String productId;

  CartDeleteProduct({required this.productId});
}

class CartDeleteProducts extends CartEvent {}

class CartUpdateProduct extends CartEvent {
  final String itemId;
  final String itemCost;
  final int itemQTE;

  CartUpdateProduct(
      {required this.itemId, required this.itemCost, required this.itemQTE});
}
