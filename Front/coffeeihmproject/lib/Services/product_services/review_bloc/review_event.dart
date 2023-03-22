import 'package:flutter/foundation.dart';



@immutable
abstract class ReviewsBlocEvent {
  const ReviewsBlocEvent();
}

class EventGetReviews extends ReviewsBlocEvent {
  final String productId;

  const EventGetReviews({required this.productId});

}

class EventAddReviews extends ReviewsBlocEvent {
  final String productId;
  final String rating;
  final String content;

  const EventAddReviews(this.productId, this.rating, this.content);

}