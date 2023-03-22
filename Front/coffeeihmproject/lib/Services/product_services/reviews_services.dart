import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeihmproject/Services/product_services/review_model.dart';
import 'package:coffeeihmproject/holders/current_user.dart';

import '../data_services/data_controller/DataExceptions.dart';
import 'dart:developer' as debug;

class ReviewsService {
  final reviews = FirebaseFirestore.instance.collection('Reviews');
  CurrentUser currentUser = CurrentUser();
  late List<ReviewModel> _reviews = [];
  late final StreamController<List<ReviewModel>> _reviewsStream;

  static final _shared = ReviewsService._sharedInstance();
  ReviewsService._sharedInstance() {
    _reviewsStream =
        StreamController<List<ReviewModel>>.broadcast(onListen: () {
      _reviewsStream.sink.add(_reviews);
    });
  }
  factory ReviewsService() => _shared;

  Stream<List<ReviewModel>> reviewsStream(String productId) {
    _cacheFan(productId);
    return _reviewsStream.stream;
  }

  Future<void> _cacheFan(String productId) async {
    final reviews = await getReviews(productId);
    _reviews = reviews.toList();
    _reviewsStream.add(_reviews);
  }

  Future<Iterable<ReviewModel>> getReviews(String productId) async {
    return await reviews
        .where("productId", isEqualTo: productId)
        .get()
        .then((value) => value.docs.map((doc) => ReviewModel.fromAPI(doc)));
  }

  Future<void> creatReview({
    required String productId,
    required String content,
    required String rating,
  }) async {
    try {
      final user = currentUser.getUser();
      DateTime now = DateTime.now();
      DateTime date = DateTime(now.year, now.month, now.day);
      await reviews.add({
        "productId": productId,
        "userId": user.userId,
        "userName": user.name,
        "content": content,
        "date": date.toString(),
        "userUri": user.imageUrl,
        "rating": rating,
      });
      _cacheFan(productId);
    } catch (e) {
      throw FailedToFetchDataException();
    }
  }
}
