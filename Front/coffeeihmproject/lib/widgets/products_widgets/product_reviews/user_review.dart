import 'package:coffeeihmproject/Services/product_services/review_model.dart';
import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/products_widgets/product_reviews/user_avatar.dart';
import 'package:flutter/material.dart';

import '../../title_widget.dart';

class UserReview extends StatelessWidget {
  final ReviewModel review;
  const UserReview({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final height = calculateHeight(review.reviewContent);
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
        bottom: MediaQuery.of(context).size.height * 0.01,
      ),
      height: MediaQuery.of(context).size.height * 0.07 + height ,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserAvatar(
              uri: review.reviewUserImageUrl,
              userName: review.reviewUserName,
              uploadDate: review.reviewUploadDate, userRating: review.reviewRating,),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
            decoration: BoxDecoration(
              color: orangeCoffeeColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            height:  height,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              child: Text(review.reviewContent, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: blackCoffeeColor),),
            )
      )],
      ),
    );
  }

  double calculateHeight(String content) => (content.length / 30) < 1? 1 * 40: ((content.length / 30)* 30) + 30;
}
