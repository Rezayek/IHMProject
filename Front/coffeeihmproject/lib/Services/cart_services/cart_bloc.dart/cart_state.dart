import '../cart_product_model.dart';

abstract class CartState {}

class CartProductStateInit extends CartState {}

class CartProductState extends CartState {
  final Exception? exception;
  final Stream<List<CartProductModel>> cartProducts;

  CartProductState({
    required this.cartProducts,
    required this.exception,
  });
}


