import 'package:coffeeihmproject/widgets/products_widgets/review_input/review_container.dart';
import 'package:flutter/material.dart';


import '../../../../constants/colors.dart';


Future<T?> writeReviewDialog<T>({
  required BuildContext context,
  required String title,
  required bool isReview

}) {
  
  
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: coffeeCakeColor,
        title: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
              color: coffeeCakeColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [coffeeCakeColor, brownCoffeeColor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  color: blackCoffeeColor, fontSize: 20, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 5),
        content: SingleChildScrollView(child: ReviewContainer(height: MediaQuery.of(context).size.height * 0.4, width: MediaQuery.of(context).size.width *0.8, isReview: isReview,)),
      );
    },
  );
}