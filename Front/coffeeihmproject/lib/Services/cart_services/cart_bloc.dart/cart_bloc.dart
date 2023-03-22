import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart_provider.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import 'dart:developer' as debug;
class CartBloc extends Bloc<CartEvent, CartState> {
  CartProvider cartDb = CartProvider();
  CartBloc() : super(CartProductStateInit()) {
    on<CartGetProducts>(
      (event, emit) async {
        try {
          final products = cartDb.cart();
          emit(CartProductState(cartProducts: products, exception: null));
        }on Exception catch (e) {
          emit(CartProductState(cartProducts: const Stream.empty(), exception: e));
        }
      },
    );

    on<CartDeleteProduct>(
      (event, emit) async {
        try {
          
          await cartDb.deleteCartItem( itemId: event.productId,);
        }on Exception  {
         // emit(CartProductState(cartProducts: const Stream.empty(), exception: e));
        }
      },
    );

    on<CartDeleteProducts>(
      (event, emit) async {
        try {
          await cartDb.deleteAllItems();
        }on Exception  {
          //emit(CartProductState(cartProducts: const Stream.empty(), exception: e));
        }
      },
    );

    on<CartUpdateProduct>(
      (event, emit) async {
        try {
          await cartDb.updateItem(itemCost: event.itemCost, itemId: event.itemId, itemQTE: event.itemQTE);
        }on Exception  {
          //emit(CartProductState(cartProducts: const Stream.empty(), exception: e));
        }
      },
    );

  }
}
