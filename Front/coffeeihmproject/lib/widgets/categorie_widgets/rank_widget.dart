import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RankWidget extends StatelessWidget {
  final String rank;
  const RankWidget({Key? key, required this.rank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
           const FaIcon(FontAwesomeIcons.rankingStar, size: 22, color: Color.fromARGB(255, 250, 171, 0),),
           TitleWidget(text: rank.isNotEmpty? rank: "?", size: 22, textWeight: FontWeight.w500, textColor: Colors.black, paddingTop: 10, paddingBottom: 0, paddingLeft: 0, aligment: Alignment.topCenter)
        ],
      ),
    );
  }
}
