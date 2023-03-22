import 'package:coffeeihmproject/widgets/home_widgets/cart_widgets/product_cart_infos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Services/cart_services/cart_bloc.dart/cart_bloc.dart';
import '../../../Services/cart_services/cart_bloc.dart/cart_state.dart';
import '../../../Services/cart_services/cart_product_model.dart';
import 'dart:developer' as debug;

class CartContainer extends StatefulWidget {
  final Stream<List<CartProductModel>> products;
  const CartContainer({super.key, required this.products});

  @override
  State<CartContainer> createState() => _CartContainerState();
}

class _CartContainerState extends State<CartContainer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.products,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
            if (snapshot.hasData && !snapshot.hasError) {
              final products = snapshot.data as Iterable<CartProductModel>;
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCartInfos(
                      product: products.elementAt(index),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case ConnectionState.done:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
