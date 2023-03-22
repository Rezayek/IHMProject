import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Services/cart_services/cart_bloc.dart/cart_bloc.dart';
import '../../../Services/cart_services/cart_bloc.dart/cart_state.dart';

class QteWidget extends StatefulWidget {
  final Function(bool isTapped) onTapAdd;
  final Function(bool isTapped) onTapRemove;
  final Function(bool isTapped) onTapDelete;
  final int qte;
  const QteWidget(
      {super.key,
      required this.onTapAdd,
      required this.qte,
      required this.onTapRemove,
      required this.onTapDelete,});

  @override
  State<QteWidget> createState() => _QteWidgetState();
}

class _QteWidgetState extends State<QteWidget> {
  late int qte;
  @override
  void initState() {
    qte = widget.qte;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.65,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  color: coffeeCakeColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        offset: const Offset(1, 1),
                        color: blackCoffeeColor.withOpacity(0.5))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleWidget(
                      text: widget.qte.toString(),
                      size: 20,
                      textWeight: FontWeight.w400,
                      textColor: blackCoffeeColor,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: MediaQuery.of(context).size.width * 0.05,
                      aligment: Alignment.center),
                  IconButton(
                      onPressed: () {
                        if (widget.qte < 100) {
                          widget.onTapAdd(true);
                        } else {
                          widget.onTapAdd(false);
                        }
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_outlined,
                        color: Colors.green,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        if (widget.qte< 2) {
                          widget.onTapRemove(false);
                        } else {
                          widget.onTapRemove(true);
                        }
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: orangeCoffeeColor,
                        size: 30,
                      )),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  widget.onTapDelete(true);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                  size: 40,
                )),
          ]),
    );
  }
}
