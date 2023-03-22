import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as debug;

class CostWidget extends StatefulWidget {
  final Stream<double> cost;
  const CostWidget({super.key, required this.cost});

  @override
  State<CostWidget> createState() => _CostWidgetState();
}

class _CostWidgetState extends State<CostWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.8,
      child: StreamBuilder<Object>(
          stream: widget.cost,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return SizedBox();
              case ConnectionState.waiting:
                return SizedBox();
              case ConnectionState.active:
                if (snapshot.hasData && !snapshot.hasError) {
                  final costTotle = snapshot.data as double;
                  debug.log("stream cost called");
                  return TitleWidget(
                      text: "Total: $costTotle\$",
                      size: 25,
                      textWeight: FontWeight.w500,
                      textColor: blackCoffeeColor,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      aligment: Alignment.center);
                } else {
                  return SizedBox();
                }
              case ConnectionState.done:
                return SizedBox();
            }
          }),
    );
  }
}
