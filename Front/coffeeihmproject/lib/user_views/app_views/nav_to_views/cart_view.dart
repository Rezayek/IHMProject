import 'package:flutter/material.dart';

import '../../../widgets/background_widget.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: const [
          Positioned(
            child: BackgroundWidget() ,
          )
        ],
      ),
    );
  }
}