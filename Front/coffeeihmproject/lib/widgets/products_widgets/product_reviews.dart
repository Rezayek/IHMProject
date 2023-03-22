import 'package:coffeeihmproject/Services/product_services/review_bloc/review_bloc.dart';
import 'package:coffeeihmproject/Services/product_services/reviews_services.dart';
import 'package:coffeeihmproject/appContollers/reviews_controller.dart';
import 'package:coffeeihmproject/widgets/home_widgets/label.dart';
import 'package:coffeeihmproject/widgets/products_widgets/add_review_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Services/product_services/review_bloc/review_event.dart';
import '../../constants/colors.dart';
import '../title_widget.dart';
import 'dart:developer' as debug;

class ProductReviews extends StatefulWidget {
  final String productId;
  final Function(List<String> result, bool isTapped) addReview;
  const ProductReviews({
    super.key,
    required this.addReview,
    required this.productId,
  });

  @override
  State<ProductReviews> createState() => _ProductReviewsState();
}

class _ProductReviewsState extends State<ProductReviews> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.83,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(title: "Reviews", gradiantColors: [orangeCoffeeColor, orangeCoffeeColor.withOpacity(0)], margin:[MediaQuery.of(context).size.height *0.01,MediaQuery.of(context).size.height *0.01,10,], expanded: 0),
          Center(
            child: AddReviewButton(
              addReview: (List<String> result, bool isTapped) {
                debug.log(result.toString());
                if (!isTapped) return;
                widget.addReview(result, true);
              },
            ),
          ),
          Center(
            child: ReviewsController(
              productId: widget.productId,
            ),
          )
        ],
      ),
    );
  }
}

class ReviewsServic {}
