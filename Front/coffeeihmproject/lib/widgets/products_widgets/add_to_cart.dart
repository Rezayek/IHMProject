import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/products_widgets/snack_bar.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddToCart extends StatelessWidget {
  final String productId;
  final String categorie;
  final String prize;
  final Function(bool isTapped) onTap;
  const AddToCart(
      {super.key,
      required this.productId,
      required this.categorie,
      required this.prize,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.03,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onTap(true);
              ScaffoldMessenger.of(context)
                  .showSnackBar(getSnackBar('Added to cart!'));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.90,
              width: MediaQuery.of(context).size.width * 0.45,
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
                  text: "Add to Cart",
                  size: 22,
                  textWeight: FontWeight.w400,
                  textColor: coffeeCakeColor,
                  paddingTop: 0,
                  paddingBottom: 0,
                  paddingLeft: 0,
                  aligment: Alignment.center),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleWidget(
                  text: prize,
                  size: 20,
                  textWeight: FontWeight.w400,
                  textColor: blackCoffeeColor,
                  paddingTop: 0,
                  paddingBottom: 0,
                  paddingLeft: 0,
                  aligment: Alignment.center),
              const FaIcon(
                FontAwesomeIcons.dollarSign,
                size: 22,
                color: Color.fromARGB(255, 0, 255, 8),
              ),
              categorie == "beans"
                  ? TitleWidget(
                      text: "/100g",
                      size: 20,
                      textWeight: FontWeight.w400,
                      textColor: blackCoffeeColor,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      aligment: Alignment.center)
                  : TitleWidget(
                      text: "/unit",
                      size: 20,
                      textWeight: FontWeight.w400,
                      textColor: blackCoffeeColor,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      aligment: Alignment.center),
            ],
          ),
        ],
      ),
    );
  }
}
