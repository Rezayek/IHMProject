import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/home_widgets/cart_widgets/responsive_button_widget.dart';
import 'package:flutter/material.dart';

class BottomButtons extends StatefulWidget {
  final Function(bool isTapped) onRemoveAll;
  final Function(bool isTapped) onConfirm;
  const BottomButtons({super.key, required this.onRemoveAll, required this.onConfirm});

  @override
  State<BottomButtons> createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.1;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => widget.onConfirm(true),
            child: ResponsiveButtonWidget(
                height: MediaQuery.of(context).size.height * 0.08,
                width: width * 0.8,
                text: "Confirm & Proceed Purchase",
                color: coffeeCakeColor, isDelete: false,),
          ),
          GestureDetector(
            onTap: () => widget.onRemoveAll(true),
            child: ResponsiveButtonWidget(
                height: MediaQuery.of(context).size.height * 0.08,
                width: width * 0.15,
                text: "",
                color: Colors.red, isDelete: true,),
          ),
        ],
      ),
    );
  }
}
