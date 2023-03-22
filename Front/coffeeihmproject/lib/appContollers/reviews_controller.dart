import 'package:coffeeihmproject/Services/product_services/review_model.dart';
import 'package:coffeeihmproject/widgets/products_widgets/product_reviews/user_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Services/product_services/review_bloc/review_bloc.dart';
import '../Services/product_services/review_bloc/review_event.dart';
import '../Services/product_services/review_bloc/review_state.dart';
import 'dart:developer' as debug;

import '../Services/product_services/reviews_services.dart';

class ReviewsController extends StatefulWidget {
  final String productId;
  const ReviewsController({super.key, required this.productId});

  @override
  State<ReviewsController> createState() => _ReviewsControllerState();
}

class _ReviewsControllerState extends State<ReviewsController> {
  @override
  void initState() {
    context
        .read<ReviewsBlocBloc>()
        .add(EventGetReviews(productId: widget.productId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBlocBloc, ReviewsBlocState>(
      builder: (context, state) {
        if (state is StateGetReviews) {
          return StreamBuilder(
            stream: state.reviewsStream,
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
                    final reviews = snapshot.data as Iterable<ReviewModel>;
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<ReviewsBlocBloc>().add( EventGetReviews(productId: widget.productId));
                          return;
                        },
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: reviews.length,
                          itemBuilder: (context, index) {
                            return UserReview(review: reviews.elementAt(index));
                          },
                        ),
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
                default:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
              }
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
