import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../title_widget.dart';

class RateWidget extends StatelessWidget {
  final String rate;
  const RateWidget({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FaIcon(
            FontAwesomeIcons.star,
            size: 22,
            color: Color.fromARGB(255, 250, 171, 0),
          ),
          TitleWidget(
              text: rate.isNotEmpty ? rate : "?",
              size: 22,
              textWeight: FontWeight.w500,
              textColor: Colors.black,
              paddingTop: 10,
              paddingBottom: 0,
              paddingLeft: 0,
              aligment: Alignment.topCenter)
        ],
      ),
    );
  }
}
