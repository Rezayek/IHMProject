import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            arabicCoffeeColor.withOpacity(0.6),
            brownCoffeeColor.withOpacity(0.6),
            coffeeCakeColor,
            
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
    );
  }
}