import 'package:coffeeihmproject/Services/product_services/review_bloc/review_event.dart';
import 'package:coffeeihmproject/constants/colors.dart';
import 'package:coffeeihmproject/widgets/drawer/drawer_view.dart';
import 'package:coffeeihmproject/widgets/products_widgets/add_to_cart.dart';
import 'package:coffeeihmproject/widgets/products_widgets/product_description.dart';
import 'package:coffeeihmproject/widgets/products_widgets/product_main_infos.dart';
import 'package:coffeeihmproject/widgets/products_widgets/product_reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Services/auth/bloc/auth_bloc.dart';
import '../../../Services/auth/bloc/auth_event.dart';
import '../../../Services/data_services/data_controller/data_model.dart';
import '../../../Services/product_services/review_bloc/review_bloc.dart';
import '../../../Services/product_services/reviews_services.dart';
import '../../../widgets/title_widget.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as DataModel;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: coffeeCakeColor,
              size: 30,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          )
        ],
        backgroundColor: blackCoffeeColor.withOpacity(0.5),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: coffeeCakeColor,
                  size: 30,
                ),
                onPressed: () => Navigator.pop(context));
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 2.2,
            width: MediaQuery.of(context).size.width,
            decoration:
                BoxDecoration(color: orangeCoffeeColor.withOpacity(0.3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductMainInfos(
                  product: product,
                ),
                TitleWidget(
                    text: product.modelName,
                    size: 25,
                    textWeight: FontWeight.w500,
                    textColor: blackCoffeeColor,
                    paddingTop: MediaQuery.of(context).size.height * 0.01,
                    paddingBottom: MediaQuery.of(context).size.height * 0.01,
                    paddingLeft: MediaQuery.of(context).size.width * 0.01,
                    aligment: Alignment.center),
                AddToCart(
                    productId: product.modelId,
                    categorie: product.modelCategorie,
                    prize: product.modelPrice, onTap: (bool isTapped) { 
                      context
                        .read<AuthBloc>()
                        .add(AddProductSEvent(itemId: product.modelId, itemName: product.modelName, itemCost: product.modelPrice, itemQte: 1, itemImg: product.modelImageUrl));
                     },),
                ProductDescription(description: product.modelDescription),
                ProductReviews(
                  productId: product.modelId,
                  addReview: (List<String> result, bool isTapped) {
                    if (isTapped) {
                      context.read<ReviewsBlocBloc>().add(EventAddReviews(
                          product.modelId, result[0], result[1]));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      drawer: const DrwerView(),
    );
  }
}
