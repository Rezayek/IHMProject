import 'package:coffeeihmproject/appContollers/cost_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Services/cart_services/cart_bloc.dart/cart_bloc.dart';
import '../../../Services/cart_services/cart_bloc.dart/cart_event.dart';
import '../../../appContollers/cart_controller.dart';
import '../../../widgets/background_widget.dart';
import '../../../widgets/home_widgets/cart_widgets/bottom_buttons.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    context.read<CartBloc>().add(CartGetProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            child: BackgroundWidget(),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 1.2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CartController(),
                  const CostController(),
                  BottomButtons(
                    onConfirm: (bool isTapped) {},
                    onRemoveAll: (bool isTapped) {
                      context.read<CartBloc>().add(CartDeleteProducts());
                    },
                  )
                ],
              ))
        ],
      ),
    );
  }
}
