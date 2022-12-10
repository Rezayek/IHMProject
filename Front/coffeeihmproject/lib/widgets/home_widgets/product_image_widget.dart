import 'package:flutter/material.dart';

import '../../constants/host.dart';

class ProductImageWidget extends StatelessWidget {
  final String itemImageUrl;
  final double height, width;
  const ProductImageWidget({Key? key, required this.itemImageUrl, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        image: itemImageUrl.isEmpty
            ? const DecorationImage(
                image: AssetImage('assets/default.jpg'), fit: BoxFit.fill)
            : DecorationImage(
                image: NetworkImage(imgUrl + itemImageUrl), fit: BoxFit.fill),
      ),
    );
  }
}
