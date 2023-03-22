import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/colors.dart';
import '../../title_widget.dart';

class UserAvatar extends StatelessWidget {
  final String uri;
  final String userName;
  final String uploadDate;
  final String userRating;
  const UserAvatar(
      {super.key,
      required this.uri,
      required this.userName,
      required this.uploadDate,
      required this.userRating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: MediaQuery.of(context).size.height * 0.02,
            backgroundImage: uri.isNotEmpty ? NetworkImage(uri) : null,
          ),
          TitleWidget(
              text: userName,
              size: 18,
              textWeight: FontWeight.w400,
              textColor: blackCoffeeColor,
              paddingTop: 0,
              paddingBottom: 0,
              paddingLeft: MediaQuery.of(context).size.width * 0.03,
              aligment: Alignment.center),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.2,
              child: Row(
                children: [
                  TitleWidget(
                      text: userRating,
                      size: 18,
                      textWeight: FontWeight.w400,
                      textColor: blackCoffeeColor,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      aligment: Alignment.center),
                  const Icon(FontAwesomeIcons.star, color: brownCoffeeColor, size: 22,)
                ],
              ),
            ),
          ),
          TitleWidget(
              text: uploadDate.substring(0,10),
              size: 18,
              textWeight: FontWeight.w400,
              textColor: blackCoffeeColor,
              paddingTop: 0,
              paddingBottom: 0,
              paddingLeft: MediaQuery.of(context).size.width * 0.1,
              aligment: Alignment.center),
        ],
      ),
    );
  }
}
