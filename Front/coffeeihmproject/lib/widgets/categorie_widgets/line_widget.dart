import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  final bool isLeft;
  final bool isTop;
  final double height;
  const LineWidget({Key? key, required this.isLeft, required this.isTop, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLeft) {
      return Center(
        child: Container(
          height: height,
          width: 1,
          decoration: const BoxDecoration(
              color: Colors.black,
              border: Border(
                  bottom: BorderSide.none,
                  top: BorderSide.none,
                  right: BorderSide.none)),
        ),
      );
    } else if (isTop) {
      return Center(
        child: Container(
          height: 1,
          width: MediaQuery.of(context).size.width * 35,
          decoration: const BoxDecoration(
              color: Colors.black,
              border: Border(
                  bottom: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none)),
        ),
      );
    } else {
      return Center(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.black,
              border: Border(
                  bottom: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none)),
        ),
      );
    }
  }
}
