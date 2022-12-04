import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemStateWidget extends StatelessWidget {
  final bool isAvailable;
  const ItemStateWidget({Key? key, required this.isAvailable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FaIcon(
            FontAwesomeIcons.store,
            size: 22,
            color: Color.fromARGB(255, 250, 112, 0),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          FaIcon(
            isAvailable ? FontAwesomeIcons.check : FontAwesomeIcons.x,
            size: 22,
            color: isAvailable
                ? const Color.fromARGB(255, 95, 255, 2)
                : const Color.fromARGB(255, 255, 2, 23),
          ),
        ],
      ),
    );
  }
}
