import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/products_widgets/review_input/write_review_dialog.dart';
import 'package:flutter/material.dart';



import '../title_widget.dart';


class AddReviewButton extends StatelessWidget {
  final Function(List<String> result, bool isTapped) addReview;
  const AddReviewButton({super.key, required this.addReview});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await writeReviewDialog(
            context: context, isReview: true, title: "Write a review");
        if (result == null) addReview([], false);
        addReview(result, true);
        
      },
      child: Container(
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.65,
        decoration: BoxDecoration(
            color: blackCoffeeColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 2,
                  offset: Offset(1, 1),
                  color: coffeeCakeColor,
                  spreadRadius: 2)
            ]),
        child: TitleWidget(
            text: "Write a review",
            size: 20,
            textWeight: FontWeight.w500,
            textColor: coffeeCakeColor,
            paddingTop: 0,
            paddingBottom: 0,
            paddingLeft: 0,
            aligment: Alignment.center),
      ),
    );
  }
}
