import 'package:coffeeihmproject/widgets/products_widgets/review_input/rating_button.dart';
import 'package:coffeeihmproject/widgets/products_widgets/review_input/review_input.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../title_widget.dart';


class ReviewContainer extends StatefulWidget {
  final double height;
  final double width;
  final bool isReview;
  const ReviewContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.isReview});

  @override
  State<ReviewContainer> createState() => _ReviewContainerState();
}

class _ReviewContainerState extends State<ReviewContainer> {
  String currentRating = "1";
  final TextEditingController textController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ReviewInput(
                  height: widget.height * 0.7,
                  width: widget.width * 0.9,
                  textController: textController)),
          SizedBox(
            height: widget.height * 0.2,
            width: widget.width,
            child: Row(
              mainAxisAlignment: widget.isReview? MainAxisAlignment.spaceEvenly: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.isReview
                    ? RatingButton(
                        height: widget.height * 0.15,
                        width: widget.width * 0.35,
                        onChange: (rating) {
                          setState(() {
                            currentRating = rating;
                          });
                        },
                      )
                    : const SizedBox(),
                GestureDetector(
                  onTap: () {
                    if(widget.isReview) Navigator.of(context).pop([currentRating, textController.text]);
                    if(!widget.isReview) Navigator.of(context).pop([textController.text]);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: blackCoffeeColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 2,
                            offset: Offset(1, 1),
                            color: coffeeCakeColor, spreadRadius: 2)
                      ]),
                    child: TitleWidget(
                      text: "Post",
                      size: 20,
                      textWeight: FontWeight.w500,
                      textColor: coffeeCakeColor,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      aligment: Alignment.center),
                    ),
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
