import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class ReviewModel {
  final String reviewId;
  final String reviewUserName;
  final String reviewUserImageUrl;
  final String reviewUploadDate;
  final String reviewContent;
  final String reviewRating;

  const ReviewModel(
      {required this.reviewId,
      required this.reviewUserName,
      required this.reviewUserImageUrl,
      required this.reviewContent,
      required this.reviewUploadDate,
      required this.reviewRating});

  factory ReviewModel.fromAPI(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) => ReviewModel(
        reviewId: snapshot.id,
        reviewUserName: snapshot.data()['userName'],
        reviewContent: snapshot.data()['content'],
        reviewUploadDate: snapshot.data()['date'],
        reviewUserImageUrl: snapshot.data()['userUri'],
        reviewRating: snapshot.data()['rating'],
      );
}
