import 'package:coffeeihmproject/user_views/app_views/nav_to_views/cart_view.dart';
import 'package:coffeeihmproject/user_views/app_views/nav_to_views/home_view.dart';
import 'package:coffeeihmproject/user_views/app_views/nav_to_views/search_view.dart';
import 'package:coffeeihmproject/widgets/title_widget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/drawer/drawer_view.dart';

class MainNavigationView extends StatefulWidget {
  static int currentViewIndex = 0;
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  
  final List<Widget> _views = [HomeView(), SearchView(), CartView()];
  final List<String> titles = ["My Coffee", "Search", "Cart"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: arabicCoffeeColor.withOpacity(0.8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              MainNavigationView.currentViewIndex == 0?
              Icons.home : MainNavigationView.currentViewIndex == 1?
              Icons.search : Icons.shopping_cart,
              color: coffeeCakeColor,
              size: 35,
            ),
            TitleWidget(text: titles[MainNavigationView.currentViewIndex], size: 30, textWeight: FontWeight.w600, textColor: coffeeCakeColor, paddingTop: 0, paddingBottom: 0, paddingLeft: 10, aligment: Alignment.centerLeft),
          ],
        ),
      ),
      body: _views[MainNavigationView.currentViewIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: arabicCoffeeColor.withOpacity(0.8),
        backgroundColor: coffeeCakeColor,
        buttonBackgroundColor: arabicCoffeeColor.withOpacity(0.8),
        height: 55,
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: coffeeCakeColor,
          ),
          Icon(
            Icons.search,
            size: 30,
            color: coffeeCakeColor,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: coffeeCakeColor,
          )
        ],
        animationDuration: const Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        index: MainNavigationView.currentViewIndex,
        onTap: (index) {
          setState(() {
            MainNavigationView.currentViewIndex = index;
          });
        },
      ),
      drawer: const DrwerView(),
    );
  }
}
