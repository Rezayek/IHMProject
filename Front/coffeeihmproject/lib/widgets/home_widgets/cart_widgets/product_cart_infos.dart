import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/home_widgets/cart_widgets/product_top_infos.dart';
import 'package:coffeeihmproject/widgets/home_widgets/cart_widgets/qte_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Services/cart_services/cart_bloc.dart/cart_bloc.dart';
import '../../../Services/cart_services/cart_bloc.dart/cart_event.dart';
import '../../../Services/cart_services/cart_product_model.dart';
import '../../../Services/cart_services/cart_provider.dart';


class ProductCartInfos extends StatefulWidget {
  final CartProductModel product;

  const ProductCartInfos({super.key, required this.product});

  @override
  State<ProductCartInfos> createState() => _ProductCartInfosState();
}

class _ProductCartInfosState extends State<ProductCartInfos> {
  CartProvider cartDb = CartProvider();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.005, bottom: MediaQuery.of(context).size.height * 0.005),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: coffeeCakeColor,
          boxShadow: const [
            BoxShadow(
                blurRadius: 2, offset: Offset(1, 1), color: blackCoffeeColor)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15) , bottomLeft: Radius.circular(15)),
                image: widget.product.itemImg.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(widget.product.itemImg),
                        fit: BoxFit.fill)
                    : const DecorationImage(
                        image: AssetImage('assets/default.jpg'),
                        fit: BoxFit.fill)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTopInfos(
                    productName: widget.product.itemName,
                    productCost: widget.product.itemCost),
                QteWidget(
                  onTapAdd: (isTapped) {
                    if (isTapped) {
                      context.read<CartBloc>().add(CartUpdateProduct(
                          itemCost: widget.product.itemCost,
                          itemId: widget.product.itemId,
                          itemQTE: widget.product.itemStock + 1));
                    }
                  },
                  qte: widget.product.itemStock,
                  onTapRemove: (isTapped) {
                    if (isTapped) {
                      context.read<CartBloc>().add(CartUpdateProduct(
                          itemCost: widget.product.itemCost,
                          itemId: widget.product.itemId,
                          itemQTE: widget.product.itemStock - 1));
                    }
                  },
                  onTapDelete: (isTapped) async {
                    if (isTapped) {
                      context.read<CartBloc>().add(
                          CartDeleteProduct(productId: widget.product.itemId));
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> updateProductInc(CartProductModel product) async =>
  //     await cartDb.updateItem(
  //       itemCost: product.itemCost,
  //       itemId: product.itemId,
  //       itemQTE: product.itemStock + 1,
  //     );

  // Future<void> updateProductDec(CartProductModel product) async =>
  //     await cartDb.updateItem(
  //       itemCost: product.itemCost,
  //       itemId: product.itemId,
  //       itemQTE: product.itemStock - 1,
  //     );
  // Future<void> deleteProduct(String productId) async => await cartDb.deleteCartItem(
  //       itemId: productId,
  //     );
}
