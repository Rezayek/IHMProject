

import 'package:coffeeihmproject/Services/product_services/review_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ReviewsBlocState {
  const ReviewsBlocState();
}

class ReviewsBlocInitial extends ReviewsBlocState {}

class StateGetReviews extends ReviewsBlocState {
  final Exception? exception;
  final Stream<List<ReviewModel>> reviewsStream;

  const StateGetReviews(this.reviewsStream, this.exception);
}

