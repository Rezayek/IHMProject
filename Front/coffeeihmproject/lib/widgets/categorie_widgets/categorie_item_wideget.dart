import 'package:coffeeihmproject/Services/auth/bloc/auth_event.dart';
import 'package:coffeeihmproject/Services/data_services/data_controller/data_model.dart';
import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/categorie_widgets/info_main_container_widget.dart';
import 'package:coffeeihmproject/widgets/categorie_widgets/line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Services/auth/bloc/auth_bloc.dart';
import '../home_widgets/product_image_widget.dart';
import '../products_widgets/snack_bar.dart';

class CategorieItemWidget extends StatelessWidget {
  final DataModel item;
  const CategorieItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width* 0.9,
      decoration: BoxDecoration(
        color: brownCoffeeColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: (){
                
                Navigator.of(context).pushNamed("/product", arguments: item); 
              },
              child: Container(
                decoration: const BoxDecoration(
                  
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [BoxShadow(
                    color: coffeeCakeColor,
                    offset: Offset(1, 1),
                    blurRadius: 2
                  )]
                ),
                child: ProductImageWidget(height: 160, itemImageUrl:item.modelImageUrl, width: MediaQuery.of(context).size.width *0.31,)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 160,
              width: MediaQuery.of(context).size.width *0.58,
              decoration: BoxDecoration(
                color: coffeeCakeColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InfoMainContainer(item: item),
                const LineWidget(isLeft: true, isTop: false, height: 150,),
                InkWell(
                  onTap: (){
                    context.read<AuthBloc>().add(AddProductSEvent(itemId: item.modelId, itemName: item.modelName, itemCost: item.modelPrice, itemQte: 1, itemImg: item.modelImageUrl));
                    ScaffoldMessenger.of(context).showSnackBar(getSnackBar('Added to cart!'));
                  },
                  child: const Icon(Icons.add_shopping_cart, color: Color.fromARGB(255, 1, 255, 9),size: 40,))
              ],
            )),
          ),
          
        ],
      ),
    );
  }
}