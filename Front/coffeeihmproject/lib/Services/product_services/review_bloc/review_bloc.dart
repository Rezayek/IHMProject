import 'package:coffeeihmproject/Services/product_services/review_bloc/review_event.dart';
import 'package:coffeeihmproject/Services/product_services/review_bloc/review_state.dart';
import 'package:coffeeihmproject/Services/product_services/review_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../reviews_services.dart';

class ReviewsBlocBloc extends Bloc<ReviewsBlocEvent, ReviewsBlocState> {
  ReviewsBlocBloc(ReviewsService provider) : super(ReviewsBlocInitial()) {
    on<EventAddReviews>((event, emit) async {
      await provider.creatReview(
          productId: event.productId,
          content: event.content,
          rating: event.rating);
    });

    on<EventGetReviews>((event, emit) async {
      Stream<List<ReviewModel>> emptyStream = const Stream.empty();
      try {
        emit(StateGetReviews(provider.reviewsStream(event.productId), null));
      } on Exception catch (e) {
        emit(StateGetReviews(emptyStream, e));
      }
    });
  }
}
