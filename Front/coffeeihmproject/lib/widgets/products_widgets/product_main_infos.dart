import 'package:coffeeihmproject/Services/data_services/data_controller/data_model.dart';
import 'package:coffeeihmproject/widgets/products_widgets/info_column.dart';
import 'package:coffeeihmproject/widgets/products_widgets/product_image_container.dart';
import 'package:flutter/material.dart';

class ProductMainInfos extends StatelessWidget {
  final DataModel product;
  const ProductMainInfos({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InfoColumn(height: MediaQuery.of(context).size.height * 0.8, width: MediaQuery.of(context).size.width * 0.3, product: product),
          ProductImageContainer(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.7,
            uri: product.modelImageUrl,
          )
        ],
      ),
    );
  }
}
