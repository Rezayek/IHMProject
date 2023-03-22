import 'package:coffeeihmproject/Services/cart_services/cart_product_model.dart';
import 'package:coffeeihmproject/widgets/home_widgets/cart_widgets/cart_container.dart';
import 'package:coffeeihmproject/widgets/home_widgets/cart_widgets/product_cart_infos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Services/cart_services/cart_bloc.dart/cart_bloc.dart';
import '../Services/cart_services/cart_bloc.dart/cart_event.dart';
import '../Services/cart_services/cart_bloc.dart/cart_state.dart';
import 'dart:developer' as debug;

class CartController extends StatefulWidget {
  const CartController({super.key});

  @override
  State<CartController> createState() => _CartControllerState();
}

class _CartControllerState extends State<CartController> {
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartProductState) {
          return CartContainer(products: state.cartProducts);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
